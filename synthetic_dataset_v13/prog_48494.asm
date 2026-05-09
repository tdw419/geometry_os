; DESCRIPTION: Draws a white line from (147, 178) to (499, 180).
; PLAN: r0=147(x1), r1=178(y1), r2=499(x2), r3=180(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 178
LDI r2, 499
LDI r3, 180
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
