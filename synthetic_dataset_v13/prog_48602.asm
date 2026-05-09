; DESCRIPTION: Draws a blue line from (338, 206) to (499, 210).
; PLAN: r0=338(x1), r1=206(y1), r2=499(x2), r3=210(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 206
LDI r2, 499
LDI r3, 210
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
