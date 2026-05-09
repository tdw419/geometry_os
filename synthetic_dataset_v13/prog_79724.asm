; DESCRIPTION: Renders a green line between points (219, 7) and (30, 144).
; PLAN: r0=219(x1), r1=7(y1), r2=30(x2), r3=144(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 7
LDI r2, 30
LDI r3, 144
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
