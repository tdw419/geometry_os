; DESCRIPTION: Draws a white line from (325, 250) to (166, 108).
; PLAN: r0=325(x1), r1=250(y1), r2=166(x2), r3=108(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 250
LDI r2, 166
LDI r3, 108
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
