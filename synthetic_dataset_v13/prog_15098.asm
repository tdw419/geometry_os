; DESCRIPTION: Places a blue line segment connecting (444, 141) to (307, 241).
; PLAN: r0=444(x1), r1=141(y1), r2=307(x2), r3=241(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 141
LDI r2, 307
LDI r3, 241
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
