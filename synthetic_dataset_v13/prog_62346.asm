; DESCRIPTION: Draws a purple line from (385, 214) to (48, 113).
; PLAN: r0=385(x1), r1=214(y1), r2=48(x2), r3=113(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 214
LDI r2, 48
LDI r3, 113
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
