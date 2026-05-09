; DESCRIPTION: Renders a red line between points (280, 84) and (446, 10).
; PLAN: r0=280(x1), r1=84(y1), r2=446(x2), r3=10(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 84
LDI r2, 446
LDI r3, 10
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
