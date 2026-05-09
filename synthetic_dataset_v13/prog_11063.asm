; DESCRIPTION: Renders a magenta line between points (328, 102) and (332, 19).
; PLAN: r0=328(x1), r1=102(y1), r2=332(x2), r3=19(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 102
LDI r2, 332
LDI r3, 19
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
