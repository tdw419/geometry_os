; DESCRIPTION: Draws a white line from (380, 172) to (362, 89).
; PLAN: r0=380(x1), r1=172(y1), r2=362(x2), r3=89(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 172
LDI r2, 362
LDI r3, 89
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
