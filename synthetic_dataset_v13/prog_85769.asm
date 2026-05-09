; DESCRIPTION: Places a red line segment connecting (400, 243) to (63, 24).
; PLAN: r0=400(x1), r1=243(y1), r2=63(x2), r3=24(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 243
LDI r2, 63
LDI r3, 24
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
