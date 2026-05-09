; DESCRIPTION: Renders a red line between points (190, 5) and (48, 59).
; PLAN: r0=190(x1), r1=5(y1), r2=48(x2), r3=59(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 5
LDI r2, 48
LDI r3, 59
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
