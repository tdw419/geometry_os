; DESCRIPTION: Draws a white line from (222, 114) to (27, 2).
; PLAN: r0=222(x1), r1=114(y1), r2=27(x2), r3=2(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 114
LDI r2, 27
LDI r3, 2
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
