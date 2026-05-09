; DESCRIPTION: Renders a green line between points (450, 92) and (108, 58).
; PLAN: r0=450(x1), r1=92(y1), r2=108(x2), r3=58(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 92
LDI r2, 108
LDI r3, 58
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
