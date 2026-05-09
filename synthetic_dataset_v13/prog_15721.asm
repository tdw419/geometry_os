; DESCRIPTION: Draws a green line from (177, 241) to (296, 140).
; PLAN: r0=177(x1), r1=241(y1), r2=296(x2), r3=140(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 241
LDI r2, 296
LDI r3, 140
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
