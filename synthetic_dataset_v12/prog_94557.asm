; DESCRIPTION: Places a red line segment connecting (63, 12) to (39, 36).
; PLAN: r0=63(x1), r1=12(y1), r2=39(x2), r3=36(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 12
LDI r2, 39
LDI r3, 36
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
