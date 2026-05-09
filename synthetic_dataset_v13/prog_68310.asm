; DESCRIPTION: Draws a green line from (453, 55) to (338, 164).
; PLAN: r0=453(x1), r1=55(y1), r2=338(x2), r3=164(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 55
LDI r2, 338
LDI r3, 164
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
