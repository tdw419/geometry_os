; DESCRIPTION: Renders a red line between points (395, 59) and (280, 173).
; PLAN: r0=395(x1), r1=59(y1), r2=280(x2), r3=173(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 59
LDI r2, 280
LDI r3, 173
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
