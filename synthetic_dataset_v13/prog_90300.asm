; DESCRIPTION: Renders a black box of size 75x79 starting at (419, 175).
; PLAN: r0=419(x), r1=175(y), r2=75(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 175
LDI r2, 75
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
