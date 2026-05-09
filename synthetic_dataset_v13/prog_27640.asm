; DESCRIPTION: Renders a purple line between points (350, 228) and (270, 56).
; PLAN: r0=350(x1), r1=228(y1), r2=270(x2), r3=56(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 228
LDI r2, 270
LDI r3, 56
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
