; DESCRIPTION: Draws a white line from (169, 208) to (465, 72).
; PLAN: r0=169(x1), r1=208(y1), r2=465(x2), r3=72(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 208
LDI r2, 465
LDI r3, 72
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
