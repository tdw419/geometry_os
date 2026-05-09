; DESCRIPTION: Draws a white line from (506, 108) to (4, 249).
; PLAN: r0=506(x1), r1=108(y1), r2=4(x2), r3=249(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 108
LDI r2, 4
LDI r3, 249
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
