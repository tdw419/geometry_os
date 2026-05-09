; DESCRIPTION: Draws a yellow line from (265, 94) to (466, 221).
; PLAN: r0=265(x1), r1=94(y1), r2=466(x2), r3=221(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 94
LDI r2, 466
LDI r3, 221
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
