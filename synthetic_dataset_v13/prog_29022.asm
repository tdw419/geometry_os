; DESCRIPTION: Draws a orange line from (197, 51) to (438, 154).
; PLAN: r0=197(x1), r1=51(y1), r2=438(x2), r3=154(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 51
LDI r2, 438
LDI r3, 154
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
