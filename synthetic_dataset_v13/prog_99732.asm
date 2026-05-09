; DESCRIPTION: Draws a yellow line from (79, 48) to (58, 104).
; PLAN: r0=79(x1), r1=48(y1), r2=58(x2), r3=104(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 48
LDI r2, 58
LDI r3, 104
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
