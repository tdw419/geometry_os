; DESCRIPTION: Renders a green line between points (297, 30) and (331, 221).
; PLAN: r0=297(x1), r1=30(y1), r2=331(x2), r3=221(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 30
LDI r2, 331
LDI r3, 221
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
