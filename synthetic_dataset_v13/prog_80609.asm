; DESCRIPTION: Draws a magenta line from (487, 119) to (460, 110).
; PLAN: r0=487(x1), r1=119(y1), r2=460(x2), r3=110(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 119
LDI r2, 460
LDI r3, 110
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
