; DESCRIPTION: Places a green line segment connecting (400, 228) to (339, 159).
; PLAN: r0=400(x1), r1=228(y1), r2=339(x2), r3=159(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 228
LDI r2, 339
LDI r3, 159
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
