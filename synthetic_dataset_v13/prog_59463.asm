; DESCRIPTION: Draws a white line from (77, 229) to (166, 240).
; PLAN: r0=77(x1), r1=229(y1), r2=166(x2), r3=240(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 229
LDI r2, 166
LDI r3, 240
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
