; DESCRIPTION: Renders a green line between points (297, 152) and (292, 92).
; PLAN: r0=297(x1), r1=152(y1), r2=292(x2), r3=92(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 152
LDI r2, 292
LDI r3, 92
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
