; DESCRIPTION: Draws a green line from (32, 90) to (129, 165).
; PLAN: r0=32(x1), r1=90(y1), r2=129(x2), r3=165(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 90
LDI r2, 129
LDI r3, 165
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
