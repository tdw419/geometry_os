; DESCRIPTION: Places a blue line segment connecting (441, 202) to (298, 208).
; PLAN: r0=441(x1), r1=202(y1), r2=298(x2), r3=208(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 202
LDI r2, 298
LDI r3, 208
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
