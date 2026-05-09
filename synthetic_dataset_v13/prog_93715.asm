; DESCRIPTION: Draws a red line from (26, 132) to (508, 154).
; PLAN: r0=26(x1), r1=132(y1), r2=508(x2), r3=154(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 132
LDI r2, 508
LDI r3, 154
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
