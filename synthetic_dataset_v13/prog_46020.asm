; DESCRIPTION: Draws a white line from (153, 5) to (499, 105).
; PLAN: r0=153(x1), r1=5(y1), r2=499(x2), r3=105(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 5
LDI r2, 499
LDI r3, 105
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
