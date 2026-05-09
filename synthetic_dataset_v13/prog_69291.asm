; DESCRIPTION: Renders a orange box of size 79x34 starting at (196, 137).
; PLAN: r0=196(x), r1=137(y), r2=79(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 137
LDI r2, 79
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
