; DESCRIPTION: Places a red line segment connecting (127, 59) to (180, 90).
; PLAN: r0=127(x1), r1=59(y1), r2=180(x2), r3=90(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 59
LDI r2, 180
LDI r3, 90
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
