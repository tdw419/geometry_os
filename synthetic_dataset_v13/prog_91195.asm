; DESCRIPTION: Draws a blue line from (267, 97) to (295, 144).
; PLAN: r0=267(x1), r1=97(y1), r2=295(x2), r3=144(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 97
LDI r2, 295
LDI r3, 144
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
