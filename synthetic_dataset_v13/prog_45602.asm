; DESCRIPTION: Draws a yellow line from (75, 101) to (380, 67).
; PLAN: r0=75(x1), r1=101(y1), r2=380(x2), r3=67(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 101
LDI r2, 380
LDI r3, 67
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
