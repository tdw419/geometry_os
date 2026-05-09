; DESCRIPTION: Draws a yellow line from (417, 227) to (400, 126).
; PLAN: r0=417(x1), r1=227(y1), r2=400(x2), r3=126(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 227
LDI r2, 400
LDI r3, 126
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
