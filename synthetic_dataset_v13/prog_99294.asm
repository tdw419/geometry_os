; DESCRIPTION: Draws a red line from (453, 69) to (164, 33).
; PLAN: r0=453(x1), r1=69(y1), r2=164(x2), r3=33(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 69
LDI r2, 164
LDI r3, 33
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
