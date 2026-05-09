; DESCRIPTION: Draws a yellow line from (293, 95) to (216, 107).
; PLAN: r0=293(x1), r1=95(y1), r2=216(x2), r3=107(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 95
LDI r2, 216
LDI r3, 107
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
