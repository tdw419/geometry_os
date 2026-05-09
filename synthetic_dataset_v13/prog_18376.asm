; DESCRIPTION: Renders a orange box of size 110x79 starting at (261, 95).
; PLAN: r0=261(x), r1=95(y), r2=110(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 95
LDI r2, 110
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
