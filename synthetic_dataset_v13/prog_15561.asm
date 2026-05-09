; DESCRIPTION: Draws a green line from (96, 122) to (267, 70).
; PLAN: r0=96(x1), r1=122(y1), r2=267(x2), r3=70(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 122
LDI r2, 267
LDI r3, 70
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
