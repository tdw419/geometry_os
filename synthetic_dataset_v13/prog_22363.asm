; DESCRIPTION: Renders a green line between points (92, 138) and (129, 146).
; PLAN: r0=92(x1), r1=138(y1), r2=129(x2), r3=146(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 138
LDI r2, 129
LDI r3, 146
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
