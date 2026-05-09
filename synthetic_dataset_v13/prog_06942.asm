; DESCRIPTION: Draws a purple line from (455, 117) to (340, 6).
; PLAN: r0=455(x1), r1=117(y1), r2=340(x2), r3=6(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 117
LDI r2, 340
LDI r3, 6
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
