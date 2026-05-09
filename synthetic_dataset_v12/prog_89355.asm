; DESCRIPTION: Renders a magenta line between points (265, 111) and (280, 17).
; PLAN: r0=265(x1), r1=111(y1), r2=280(x2), r3=17(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 111
LDI r2, 280
LDI r3, 17
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
