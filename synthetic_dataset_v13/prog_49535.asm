; DESCRIPTION: Draws a yellow line from (496, 255) to (54, 171).
; PLAN: r0=496(x1), r1=255(y1), r2=54(x2), r3=171(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 255
LDI r2, 54
LDI r3, 171
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
