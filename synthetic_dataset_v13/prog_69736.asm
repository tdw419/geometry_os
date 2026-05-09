; DESCRIPTION: Draws a cyan line from (417, 218) to (378, 188).
; PLAN: r0=417(x1), r1=218(y1), r2=378(x2), r3=188(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 218
LDI r2, 378
LDI r3, 188
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
