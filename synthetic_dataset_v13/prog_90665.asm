; DESCRIPTION: Places a red line segment connecting (481, 247) to (473, 255).
; PLAN: r0=481(x1), r1=247(y1), r2=473(x2), r3=255(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 247
LDI r2, 473
LDI r3, 255
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
