; DESCRIPTION: Draws a blue line from (440, 78) to (499, 210).
; PLAN: r0=440(x1), r1=78(y1), r2=499(x2), r3=210(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 78
LDI r2, 499
LDI r3, 210
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
