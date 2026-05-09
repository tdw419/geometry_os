; DESCRIPTION: Draws a blue line from (187, 41) to (278, 154).
; PLAN: r0=187(x1), r1=41(y1), r2=278(x2), r3=154(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 41
LDI r2, 278
LDI r3, 154
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
