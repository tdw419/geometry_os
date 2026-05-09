; DESCRIPTION: Draws a white line from (127, 101) to (418, 229).
; PLAN: r0=127(x1), r1=101(y1), r2=418(x2), r3=229(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 101
LDI r2, 418
LDI r3, 229
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
