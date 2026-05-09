; DESCRIPTION: Renders a white box of size 79x20 starting at (125, 90).
; PLAN: r0=125(x), r1=90(y), r2=79(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 90
LDI r2, 79
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
