; DESCRIPTION: Places a red line segment connecting (481, 176) to (451, 154).
; PLAN: r0=481(x1), r1=176(y1), r2=451(x2), r3=154(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 176
LDI r2, 451
LDI r3, 154
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
