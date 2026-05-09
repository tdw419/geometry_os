; DESCRIPTION: Renders a green line between points (92, 247) and (49, 141).
; PLAN: r0=92(x1), r1=247(y1), r2=49(x2), r3=141(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 247
LDI r2, 49
LDI r3, 141
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
