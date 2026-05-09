; DESCRIPTION: Places a magenta line segment connecting (426, 103) to (277, 211).
; PLAN: r0=426(x1), r1=103(y1), r2=277(x2), r3=211(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 103
LDI r2, 277
LDI r3, 211
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
