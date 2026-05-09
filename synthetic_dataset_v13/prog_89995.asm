; DESCRIPTION: Places a magenta line segment connecting (71, 230) to (350, 115).
; PLAN: r0=71(x1), r1=230(y1), r2=350(x2), r3=115(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 230
LDI r2, 350
LDI r3, 115
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
