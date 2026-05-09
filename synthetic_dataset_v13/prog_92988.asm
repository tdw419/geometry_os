; DESCRIPTION: Places a red line segment connecting (107, 206) to (80, 67).
; PLAN: r0=107(x1), r1=206(y1), r2=80(x2), r3=67(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 206
LDI r2, 80
LDI r3, 67
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
