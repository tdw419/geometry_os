; DESCRIPTION: Renders a magenta line between points (364, 61) and (222, 167).
; PLAN: r0=364(x1), r1=61(y1), r2=222(x2), r3=167(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 61
LDI r2, 222
LDI r3, 167
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
