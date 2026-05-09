; DESCRIPTION: Renders a red line between points (218, 92) and (168, 71).
; PLAN: r0=218(x1), r1=92(y1), r2=168(x2), r3=71(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 92
LDI r2, 168
LDI r3, 71
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
