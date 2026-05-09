; DESCRIPTION: Renders a white box of size 79x13 starting at (84, 179).
; PLAN: r0=84(x), r1=179(y), r2=79(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 179
LDI r2, 79
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
