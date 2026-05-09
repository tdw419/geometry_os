; DESCRIPTION: Draws a green line from (350, 19) to (113, 79).
; PLAN: r0=350(x1), r1=19(y1), r2=113(x2), r3=79(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 19
LDI r2, 113
LDI r3, 79
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
