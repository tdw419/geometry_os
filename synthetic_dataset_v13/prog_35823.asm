; DESCRIPTION: Places a black line segment connecting (502, 147) to (453, 146).
; PLAN: r0=502(x1), r1=147(y1), r2=453(x2), r3=146(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 147
LDI r2, 453
LDI r3, 146
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
