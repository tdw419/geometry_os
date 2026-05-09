; DESCRIPTION: Draws a yellow line from (425, 176) to (417, 78).
; PLAN: r0=425(x1), r1=176(y1), r2=417(x2), r3=78(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 176
LDI r2, 417
LDI r3, 78
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
