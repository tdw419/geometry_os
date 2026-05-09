; DESCRIPTION: Renders a orange box of size 55x115 starting at (77, 58).
; PLAN: r0=77(x), r1=58(y), r2=55(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 58
LDI r2, 55
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
