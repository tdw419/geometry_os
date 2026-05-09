; DESCRIPTION: Draws a orange line from (280, 195) to (317, 84).
; PLAN: r0=280(x1), r1=195(y1), r2=317(x2), r3=84(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 195
LDI r2, 317
LDI r3, 84
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
