; DESCRIPTION: Places a blue line segment connecting (217, 74) to (154, 51).
; PLAN: r0=217(x1), r1=74(y1), r2=154(x2), r3=51(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 74
LDI r2, 154
LDI r3, 51
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
