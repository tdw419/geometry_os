; DESCRIPTION: Draws a blue line from (207, 166) to (124, 246).
; PLAN: r0=207(x1), r1=166(y1), r2=124(x2), r3=246(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 166
LDI r2, 124
LDI r3, 246
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
