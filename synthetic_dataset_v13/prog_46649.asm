; DESCRIPTION: Places a green line segment connecting (439, 148) to (197, 254).
; PLAN: r0=439(x1), r1=148(y1), r2=197(x2), r3=254(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 148
LDI r2, 197
LDI r3, 254
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
