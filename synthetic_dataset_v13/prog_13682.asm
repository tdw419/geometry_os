; DESCRIPTION: Renders a green box of size 96x51 starting at (251, 33).
; PLAN: r0=251(x), r1=33(y), r2=96(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 33
LDI r2, 96
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
