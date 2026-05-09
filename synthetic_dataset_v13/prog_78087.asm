; DESCRIPTION: Draws a blue line from (272, 2) to (460, 37).
; PLAN: r0=272(x1), r1=2(y1), r2=460(x2), r3=37(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 2
LDI r2, 460
LDI r3, 37
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
