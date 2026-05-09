; DESCRIPTION: Renders a magenta line between points (270, 228) and (364, 96).
; PLAN: r0=270(x1), r1=228(y1), r2=364(x2), r3=96(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 228
LDI r2, 364
LDI r3, 96
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
