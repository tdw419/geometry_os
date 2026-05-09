; DESCRIPTION: Renders a yellow line between points (102, 93) and (305, 218).
; PLAN: r0=102(x1), r1=93(y1), r2=305(x2), r3=218(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 93
LDI r2, 305
LDI r3, 218
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
