; DESCRIPTION: Renders a orange box of size 80x83 starting at (141, 55).
; PLAN: r0=141(x), r1=55(y), r2=80(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 55
LDI r2, 80
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
