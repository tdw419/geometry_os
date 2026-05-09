; DESCRIPTION: Draws a green line from (221, 237) to (141, 54).
; PLAN: r0=221(x1), r1=237(y1), r2=141(x2), r3=54(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 237
LDI r2, 141
LDI r3, 54
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
