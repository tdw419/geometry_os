; DESCRIPTION: Places a purple line segment connecting (113, 4) to (470, 192).
; PLAN: r0=113(x1), r1=4(y1), r2=470(x2), r3=192(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 4
LDI r2, 470
LDI r3, 192
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
