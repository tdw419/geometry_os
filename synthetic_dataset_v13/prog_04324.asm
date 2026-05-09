; DESCRIPTION: Places a black line segment connecting (188, 197) to (231, 204).
; PLAN: r0=188(x1), r1=197(y1), r2=231(x2), r3=204(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 197
LDI r2, 231
LDI r3, 204
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
