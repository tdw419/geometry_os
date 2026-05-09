; DESCRIPTION: Draws a green line from (71, 236) to (296, 47).
; PLAN: r0=71(x1), r1=236(y1), r2=296(x2), r3=47(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 236
LDI r2, 296
LDI r3, 47
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
