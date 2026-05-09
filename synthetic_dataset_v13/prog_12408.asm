; DESCRIPTION: Draws a blue line from (288, 249) to (209, 172).
; PLAN: r0=288(x1), r1=249(y1), r2=209(x2), r3=172(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 249
LDI r2, 209
LDI r3, 172
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
