; DESCRIPTION: Places a green line segment connecting (50, 71) to (207, 232).
; PLAN: r0=50(x1), r1=71(y1), r2=207(x2), r3=232(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 71
LDI r2, 207
LDI r3, 232
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
