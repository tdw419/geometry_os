; DESCRIPTION: Places a purple line segment connecting (263, 39) to (393, 128).
; PLAN: r0=263(x1), r1=39(y1), r2=393(x2), r3=128(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 39
LDI r2, 393
LDI r3, 128
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
