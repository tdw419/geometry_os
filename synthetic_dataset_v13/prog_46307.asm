; DESCRIPTION: Draws a blue line from (393, 58) to (499, 71).
; PLAN: r0=393(x1), r1=58(y1), r2=499(x2), r3=71(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 58
LDI r2, 499
LDI r3, 71
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
