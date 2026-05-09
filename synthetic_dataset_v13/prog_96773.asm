; DESCRIPTION: Draws a blue line from (460, 75) to (354, 7).
; PLAN: r0=460(x1), r1=75(y1), r2=354(x2), r3=7(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 75
LDI r2, 354
LDI r3, 7
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
