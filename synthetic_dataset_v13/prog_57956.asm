; DESCRIPTION: Draws a cyan line from (62, 15) to (296, 254).
; PLAN: r0=62(x1), r1=15(y1), r2=296(x2), r3=254(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 15
LDI r2, 296
LDI r3, 254
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
