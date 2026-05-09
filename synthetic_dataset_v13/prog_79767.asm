; DESCRIPTION: Draws a yellow line from (268, 30) to (293, 182).
; PLAN: r0=268(x1), r1=30(y1), r2=293(x2), r3=182(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 30
LDI r2, 293
LDI r3, 182
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
