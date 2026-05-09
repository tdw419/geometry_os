; DESCRIPTION: Places a red line segment connecting (133, 231) to (120, 204).
; PLAN: r0=133(x1), r1=231(y1), r2=120(x2), r3=204(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 231
LDI r2, 120
LDI r3, 204
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
