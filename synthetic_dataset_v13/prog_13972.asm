; DESCRIPTION: Places a green line segment connecting (92, 94) to (297, 82).
; PLAN: r0=92(x1), r1=94(y1), r2=297(x2), r3=82(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 94
LDI r2, 297
LDI r3, 82
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
