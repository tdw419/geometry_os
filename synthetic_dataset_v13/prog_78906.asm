; DESCRIPTION: Renders a red line between points (283, 156) and (398, 59).
; PLAN: r0=283(x1), r1=156(y1), r2=398(x2), r3=59(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 156
LDI r2, 398
LDI r3, 59
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
