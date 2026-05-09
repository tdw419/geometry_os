; DESCRIPTION: Draws a white line from (450, 110) to (202, 203).
; PLAN: r0=450(x1), r1=110(y1), r2=202(x2), r3=203(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 110
LDI r2, 202
LDI r3, 203
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
