; DESCRIPTION: Draws a white line from (114, 212) to (280, 123).
; PLAN: r0=114(x1), r1=212(y1), r2=280(x2), r3=123(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 212
LDI r2, 280
LDI r3, 123
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
