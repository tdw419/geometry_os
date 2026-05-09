; DESCRIPTION: Draws a green line from (312, 151) to (86, 187).
; PLAN: r0=312(x1), r1=151(y1), r2=86(x2), r3=187(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 151
LDI r2, 86
LDI r3, 187
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
