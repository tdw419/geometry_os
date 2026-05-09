; DESCRIPTION: Renders a magenta line between points (417, 205) and (263, 22).
; PLAN: r0=417(x1), r1=205(y1), r2=263(x2), r3=22(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 205
LDI r2, 263
LDI r3, 22
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
