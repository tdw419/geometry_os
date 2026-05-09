; DESCRIPTION: Draws a yellow line from (501, 193) to (179, 125).
; PLAN: r0=501(x1), r1=193(y1), r2=179(x2), r3=125(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 193
LDI r2, 179
LDI r3, 125
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
