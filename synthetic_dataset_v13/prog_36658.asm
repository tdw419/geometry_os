; DESCRIPTION: Draws a black line from (453, 192) to (111, 209).
; PLAN: r0=453(x1), r1=192(y1), r2=111(x2), r3=209(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 192
LDI r2, 111
LDI r3, 209
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
