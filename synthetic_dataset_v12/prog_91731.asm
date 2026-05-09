; DESCRIPTION: Renders a red line between points (317, 17) and (262, 59).
; PLAN: r0=317(x1), r1=17(y1), r2=262(x2), r3=59(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 17
LDI r2, 262
LDI r3, 59
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
