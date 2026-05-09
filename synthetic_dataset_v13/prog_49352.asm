; DESCRIPTION: Renders a purple line between points (185, 228) and (188, 207).
; PLAN: r0=185(x1), r1=228(y1), r2=188(x2), r3=207(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 228
LDI r2, 188
LDI r3, 207
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
