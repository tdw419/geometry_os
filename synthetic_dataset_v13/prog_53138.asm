; DESCRIPTION: Places a red line segment connecting (163, 206) to (205, 50).
; PLAN: r0=163(x1), r1=206(y1), r2=205(x2), r3=50(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 206
LDI r2, 205
LDI r3, 50
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
