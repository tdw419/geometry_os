; DESCRIPTION: Places a green line segment connecting (87, 204) to (403, 63).
; PLAN: r0=87(x1), r1=204(y1), r2=403(x2), r3=63(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 204
LDI r2, 403
LDI r3, 63
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
