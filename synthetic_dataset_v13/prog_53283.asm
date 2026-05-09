; DESCRIPTION: Draws a blue line from (123, 230) to (217, 48).
; PLAN: r0=123(x1), r1=230(y1), r2=217(x2), r3=48(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 230
LDI r2, 217
LDI r3, 48
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
