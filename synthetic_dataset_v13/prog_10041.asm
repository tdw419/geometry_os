; DESCRIPTION: Renders a magenta line between points (56, 220) and (263, 222).
; PLAN: r0=56(x1), r1=220(y1), r2=263(x2), r3=222(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 220
LDI r2, 263
LDI r3, 222
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
