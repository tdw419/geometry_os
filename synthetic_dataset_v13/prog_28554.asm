; DESCRIPTION: Draws a red line from (358, 111) to (350, 63).
; PLAN: r0=358(x1), r1=111(y1), r2=350(x2), r3=63(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 111
LDI r2, 350
LDI r3, 63
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
