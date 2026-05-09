; DESCRIPTION: Places a blue line segment connecting (217, 173) to (241, 106).
; PLAN: r0=217(x1), r1=173(y1), r2=241(x2), r3=106(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 173
LDI r2, 241
LDI r3, 106
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
