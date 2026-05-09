; DESCRIPTION: Places a green line segment connecting (373, 82) to (126, 230).
; PLAN: r0=373(x1), r1=82(y1), r2=126(x2), r3=230(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 82
LDI r2, 126
LDI r3, 230
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
