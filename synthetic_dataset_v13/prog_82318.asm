; DESCRIPTION: Places a green line segment connecting (506, 195) to (403, 245).
; PLAN: r0=506(x1), r1=195(y1), r2=403(x2), r3=245(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 195
LDI r2, 403
LDI r3, 245
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
