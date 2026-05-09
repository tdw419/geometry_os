; DESCRIPTION: Places a red line segment connecting (422, 40) to (243, 204).
; PLAN: r0=422(x1), r1=40(y1), r2=243(x2), r3=204(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 40
LDI r2, 243
LDI r3, 204
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
