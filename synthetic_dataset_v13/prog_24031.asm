; DESCRIPTION: Places a black line segment connecting (362, 215) to (444, 216).
; PLAN: r0=362(x1), r1=215(y1), r2=444(x2), r3=216(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 215
LDI r2, 444
LDI r3, 216
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
