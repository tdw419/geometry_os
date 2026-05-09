; DESCRIPTION: Draws a yellow line from (207, 73) to (12, 40).
; PLAN: r0=207(x1), r1=73(y1), r2=12(x2), r3=40(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 73
LDI r2, 12
LDI r3, 40
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
