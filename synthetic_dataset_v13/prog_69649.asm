; DESCRIPTION: Draws a white line from (181, 202) to (132, 154).
; PLAN: r0=181(x1), r1=202(y1), r2=132(x2), r3=154(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 202
LDI r2, 132
LDI r3, 154
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
