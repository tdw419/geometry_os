; DESCRIPTION: Draws a white line from (465, 142) to (174, 185).
; PLAN: r0=465(x1), r1=142(y1), r2=174(x2), r3=185(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 142
LDI r2, 174
LDI r3, 185
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
