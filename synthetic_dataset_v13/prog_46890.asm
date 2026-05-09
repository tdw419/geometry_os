; DESCRIPTION: Places a green line segment connecting (263, 227) to (312, 213).
; PLAN: r0=263(x1), r1=227(y1), r2=312(x2), r3=213(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 227
LDI r2, 312
LDI r3, 213
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
