; DESCRIPTION: Draws a purple line from (307, 77) to (340, 29).
; PLAN: r0=307(x1), r1=77(y1), r2=340(x2), r3=29(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 77
LDI r2, 340
LDI r3, 29
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
