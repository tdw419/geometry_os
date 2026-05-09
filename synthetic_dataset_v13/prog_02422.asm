; DESCRIPTION: Places a cyan line segment connecting (381, 219) to (505, 191).
; PLAN: r0=381(x1), r1=219(y1), r2=505(x2), r3=191(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 219
LDI r2, 505
LDI r3, 191
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
