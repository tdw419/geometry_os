; DESCRIPTION: Draws a red line from (425, 174) to (277, 69).
; PLAN: r0=425(x1), r1=174(y1), r2=277(x2), r3=69(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 174
LDI r2, 277
LDI r3, 69
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
