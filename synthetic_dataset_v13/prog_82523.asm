; DESCRIPTION: Draws a purple line from (207, 114) to (299, 125).
; PLAN: r0=207(x1), r1=114(y1), r2=299(x2), r3=125(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 114
LDI r2, 299
LDI r3, 125
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
