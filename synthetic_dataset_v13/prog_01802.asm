; DESCRIPTION: Places a green line segment connecting (451, 221) to (164, 172).
; PLAN: r0=451(x1), r1=221(y1), r2=164(x2), r3=172(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 221
LDI r2, 164
LDI r3, 172
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
