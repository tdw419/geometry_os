; DESCRIPTION: Draws a magenta line from (253, 69) to (208, 30).
; PLAN: r0=253(x1), r1=69(y1), r2=208(x2), r3=30(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 69
LDI r2, 208
LDI r3, 30
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
