; DESCRIPTION: Places a white line segment connecting (190, 37) to (404, 101).
; PLAN: r0=190(x1), r1=37(y1), r2=404(x2), r3=101(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 37
LDI r2, 404
LDI r3, 101
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
