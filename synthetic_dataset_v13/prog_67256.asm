; DESCRIPTION: Places a red line segment connecting (272, 117) to (326, 38).
; PLAN: r0=272(x1), r1=117(y1), r2=326(x2), r3=38(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 117
LDI r2, 326
LDI r3, 38
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
