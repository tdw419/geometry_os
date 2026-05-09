; DESCRIPTION: Draws a yellow line from (171, 253) to (138, 39).
; PLAN: r0=171(x1), r1=253(y1), r2=138(x2), r3=39(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 253
LDI r2, 138
LDI r3, 39
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
