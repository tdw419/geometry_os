; DESCRIPTION: Renders a red line between points (317, 68) and (108, 196).
; PLAN: r0=317(x1), r1=68(y1), r2=108(x2), r3=196(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 68
LDI r2, 108
LDI r3, 196
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
