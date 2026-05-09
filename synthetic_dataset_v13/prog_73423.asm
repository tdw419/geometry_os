; DESCRIPTION: Places a cyan line segment connecting (237, 19) to (296, 137).
; PLAN: r0=237(x1), r1=19(y1), r2=296(x2), r3=137(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 19
LDI r2, 296
LDI r3, 137
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
