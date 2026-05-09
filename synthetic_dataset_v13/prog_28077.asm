; DESCRIPTION: Draws a white line from (367, 15) to (178, 155).
; PLAN: r0=367(x1), r1=15(y1), r2=178(x2), r3=155(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 15
LDI r2, 178
LDI r3, 155
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
