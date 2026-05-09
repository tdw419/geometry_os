; DESCRIPTION: Draws a green line from (474, 252) to (248, 38).
; PLAN: r0=474(x1), r1=252(y1), r2=248(x2), r3=38(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 252
LDI r2, 248
LDI r3, 38
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
