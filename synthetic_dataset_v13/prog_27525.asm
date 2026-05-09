; DESCRIPTION: Draws a white line from (174, 17) to (55, 26).
; PLAN: r0=174(x1), r1=17(y1), r2=55(x2), r3=26(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 17
LDI r2, 55
LDI r3, 26
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
