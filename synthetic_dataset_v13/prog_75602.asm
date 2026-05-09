; DESCRIPTION: Draws a purple line from (400, 114) to (154, 113).
; PLAN: r0=400(x1), r1=114(y1), r2=154(x2), r3=113(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 114
LDI r2, 154
LDI r3, 113
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
