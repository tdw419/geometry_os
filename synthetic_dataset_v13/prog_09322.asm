; DESCRIPTION: Renders a white box of size 79x107 starting at (317, 1).
; PLAN: r0=317(x), r1=1(y), r2=79(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 1
LDI r2, 79
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
