; DESCRIPTION: Draws a black line from (453, 144) to (237, 40).
; PLAN: r0=453(x1), r1=144(y1), r2=237(x2), r3=40(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 144
LDI r2, 237
LDI r3, 40
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
