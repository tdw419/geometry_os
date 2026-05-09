; DESCRIPTION: Draws a white line from (277, 156) to (70, 90).
; PLAN: r0=277(x1), r1=156(y1), r2=70(x2), r3=90(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 156
LDI r2, 70
LDI r3, 90
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
