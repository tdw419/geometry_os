; DESCRIPTION: Places a yellow line segment connecting (388, 237) to (453, 146).
; PLAN: r0=388(x1), r1=237(y1), r2=453(x2), r3=146(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 237
LDI r2, 453
LDI r3, 146
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
