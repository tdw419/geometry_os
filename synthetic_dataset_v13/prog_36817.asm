; DESCRIPTION: Renders a magenta line between points (166, 219) and (263, 249).
; PLAN: r0=166(x1), r1=219(y1), r2=263(x2), r3=249(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 219
LDI r2, 263
LDI r3, 249
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
