; DESCRIPTION: Renders a purple line between points (0, 228) and (144, 178).
; PLAN: r0=0(x1), r1=228(y1), r2=144(x2), r3=178(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 228
LDI r2, 144
LDI r3, 178
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
