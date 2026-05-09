; DESCRIPTION: Draws a blue line from (280, 31) to (460, 156).
; PLAN: r0=280(x1), r1=31(y1), r2=460(x2), r3=156(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 31
LDI r2, 460
LDI r3, 156
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
