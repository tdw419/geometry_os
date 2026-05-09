; DESCRIPTION: Renders a magenta line between points (132, 192) and (67, 249).
; PLAN: r0=132(x1), r1=192(y1), r2=67(x2), r3=249(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 192
LDI r2, 67
LDI r3, 249
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
