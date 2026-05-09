; DESCRIPTION: Draws a green line from (417, 177) to (252, 124).
; PLAN: r0=417(x1), r1=177(y1), r2=252(x2), r3=124(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 177
LDI r2, 252
LDI r3, 124
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
