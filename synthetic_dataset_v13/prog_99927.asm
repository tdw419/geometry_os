; DESCRIPTION: Places a green line segment connecting (273, 243) to (296, 9).
; PLAN: r0=273(x1), r1=243(y1), r2=296(x2), r3=9(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 243
LDI r2, 296
LDI r3, 9
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
