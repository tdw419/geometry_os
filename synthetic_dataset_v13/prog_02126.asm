; DESCRIPTION: Draws a red line from (362, 223) to (473, 104).
; PLAN: r0=362(x1), r1=223(y1), r2=473(x2), r3=104(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 223
LDI r2, 473
LDI r3, 104
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
