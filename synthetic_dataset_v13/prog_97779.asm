; DESCRIPTION: Places a cyan line segment connecting (326, 212) to (266, 248).
; PLAN: r0=326(x1), r1=212(y1), r2=266(x2), r3=248(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 212
LDI r2, 266
LDI r3, 248
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
