; DESCRIPTION: Renders a red line between points (63, 208) and (92, 70).
; PLAN: r0=63(x1), r1=208(y1), r2=92(x2), r3=70(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 208
LDI r2, 92
LDI r3, 70
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
