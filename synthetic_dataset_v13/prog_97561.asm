; DESCRIPTION: Renders a magenta line between points (297, 163) and (386, 203).
; PLAN: r0=297(x1), r1=163(y1), r2=386(x2), r3=203(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 163
LDI r2, 386
LDI r3, 203
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
