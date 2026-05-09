; DESCRIPTION: Draws a green line from (175, 150) to (497, 153).
; PLAN: r0=175(x1), r1=150(y1), r2=497(x2), r3=153(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 150
LDI r2, 497
LDI r3, 153
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
