; DESCRIPTION: Renders a magenta line between points (346, 13) and (297, 71).
; PLAN: r0=346(x1), r1=13(y1), r2=297(x2), r3=71(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 13
LDI r2, 297
LDI r3, 71
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
