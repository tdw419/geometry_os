; DESCRIPTION: Places a orange line segment connecting (274, 195) to (277, 51).
; PLAN: r0=274(x1), r1=195(y1), r2=277(x2), r3=51(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 195
LDI r2, 277
LDI r3, 51
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
