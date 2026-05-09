; DESCRIPTION: Draws a purple line from (197, 165) to (201, 228).
; PLAN: r0=197(x1), r1=165(y1), r2=201(x2), r3=228(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 165
LDI r2, 201
LDI r3, 228
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
