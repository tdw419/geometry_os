; DESCRIPTION: Renders a orange box of size 72x55 starting at (31, 188).
; PLAN: r0=31(x), r1=188(y), r2=72(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 188
LDI r2, 72
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
