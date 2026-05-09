; DESCRIPTION: Places a magenta line segment connecting (217, 49) to (191, 253).
; PLAN: r0=217(x1), r1=49(y1), r2=191(x2), r3=253(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 49
LDI r2, 191
LDI r3, 253
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
