; DESCRIPTION: Places a red line segment connecting (442, 59) to (27, 36).
; PLAN: r0=442(x1), r1=59(y1), r2=27(x2), r3=36(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 59
LDI r2, 27
LDI r3, 36
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
