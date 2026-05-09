; DESCRIPTION: Draws a yellow line from (20, 125) to (104, 103).
; PLAN: r0=20(x1), r1=125(y1), r2=104(x2), r3=103(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 125
LDI r2, 104
LDI r3, 103
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
