; DESCRIPTION: Draws a magenta line from (372, 153) to (104, 115).
; PLAN: r0=372(x1), r1=153(y1), r2=104(x2), r3=115(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 153
LDI r2, 104
LDI r3, 115
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
