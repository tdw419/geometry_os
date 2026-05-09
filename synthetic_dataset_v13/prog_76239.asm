; DESCRIPTION: Renders a yellow line between points (68, 250) and (202, 92).
; PLAN: r0=68(x1), r1=250(y1), r2=202(x2), r3=92(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 250
LDI r2, 202
LDI r3, 92
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
