; DESCRIPTION: Places a magenta line segment connecting (249, 253) to (300, 209).
; PLAN: r0=249(x1), r1=253(y1), r2=300(x2), r3=209(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 253
LDI r2, 300
LDI r3, 209
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
