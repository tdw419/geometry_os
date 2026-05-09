; DESCRIPTION: Draws a yellow line from (268, 0) to (103, 61).
; PLAN: r0=268(x1), r1=0(y1), r2=103(x2), r3=61(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 0
LDI r2, 103
LDI r3, 61
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
