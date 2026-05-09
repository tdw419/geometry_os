; DESCRIPTION: Renders a magenta line between points (297, 205) and (425, 200).
; PLAN: r0=297(x1), r1=205(y1), r2=425(x2), r3=200(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 205
LDI r2, 425
LDI r3, 200
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
