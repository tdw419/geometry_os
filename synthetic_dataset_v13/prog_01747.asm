; DESCRIPTION: Draws a red line from (3, 177) to (268, 222).
; PLAN: r0=3(x1), r1=177(y1), r2=268(x2), r3=222(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 177
LDI r2, 268
LDI r3, 222
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
