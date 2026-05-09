; DESCRIPTION: Renders a orange box of size 18x75 starting at (288, 179).
; PLAN: r0=288(x), r1=179(y), r2=18(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 179
LDI r2, 18
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
