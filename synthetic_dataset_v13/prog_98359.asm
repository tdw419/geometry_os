; DESCRIPTION: Places a purple line segment connecting (424, 205) to (328, 207).
; PLAN: r0=424(x1), r1=205(y1), r2=328(x2), r3=207(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 205
LDI r2, 328
LDI r3, 207
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
