; DESCRIPTION: Places a yellow line segment connecting (404, 193) to (43, 24).
; PLAN: r0=404(x1), r1=193(y1), r2=43(x2), r3=24(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 193
LDI r2, 43
LDI r3, 24
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
