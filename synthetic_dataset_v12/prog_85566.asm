; DESCRIPTION: Renders a green line between points (92, 89) and (362, 120).
; PLAN: r0=92(x1), r1=89(y1), r2=362(x2), r3=120(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 89
LDI r2, 362
LDI r3, 120
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
