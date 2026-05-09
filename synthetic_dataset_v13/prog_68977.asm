; DESCRIPTION: Draws a white line from (465, 46) to (40, 229).
; PLAN: r0=465(x1), r1=46(y1), r2=40(x2), r3=229(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 46
LDI r2, 40
LDI r3, 229
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
