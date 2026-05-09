; DESCRIPTION: Draws a purple line from (240, 69) to (225, 142).
; PLAN: r0=240(x1), r1=69(y1), r2=225(x2), r3=142(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 69
LDI r2, 225
LDI r3, 142
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
