; DESCRIPTION: Draws a yellow line from (76, 84) to (267, 231).
; PLAN: r0=76(x1), r1=84(y1), r2=267(x2), r3=231(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 84
LDI r2, 267
LDI r3, 231
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
