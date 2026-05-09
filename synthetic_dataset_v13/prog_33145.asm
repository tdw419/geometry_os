; DESCRIPTION: Draws a white line from (316, 54) to (202, 168).
; PLAN: r0=316(x1), r1=54(y1), r2=202(x2), r3=168(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 54
LDI r2, 202
LDI r3, 168
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
