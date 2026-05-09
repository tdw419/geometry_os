; DESCRIPTION: Draws a magenta line from (107, 104) to (27, 80).
; PLAN: r0=107(x1), r1=104(y1), r2=27(x2), r3=80(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 104
LDI r2, 27
LDI r3, 80
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
