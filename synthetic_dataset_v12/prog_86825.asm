; DESCRIPTION: Draws a green line from (58, 19) to (74, 88).
; PLAN: r0=58(x1), r1=19(y1), r2=74(x2), r3=88(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 19
LDI r2, 74
LDI r3, 88
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
