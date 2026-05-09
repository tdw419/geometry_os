; DESCRIPTION: Renders a purple line between points (150, 228) and (470, 245).
; PLAN: r0=150(x1), r1=228(y1), r2=470(x2), r3=245(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 228
LDI r2, 470
LDI r3, 245
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
