; DESCRIPTION: Places a white line segment connecting (404, 158) to (280, 103).
; PLAN: r0=404(x1), r1=158(y1), r2=280(x2), r3=103(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 158
LDI r2, 280
LDI r3, 103
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
