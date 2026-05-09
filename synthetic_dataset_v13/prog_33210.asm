; DESCRIPTION: Draws a purple line from (25, 128) to (267, 146).
; PLAN: r0=25(x1), r1=128(y1), r2=267(x2), r3=146(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 128
LDI r2, 267
LDI r3, 146
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
