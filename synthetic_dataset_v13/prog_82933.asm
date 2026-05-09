; DESCRIPTION: Places a yellow line segment connecting (164, 197) to (421, 50).
; PLAN: r0=164(x1), r1=197(y1), r2=421(x2), r3=50(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 197
LDI r2, 421
LDI r3, 50
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
