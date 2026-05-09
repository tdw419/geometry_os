; DESCRIPTION: Draws a black line from (362, 153) to (331, 154).
; PLAN: r0=362(x1), r1=153(y1), r2=331(x2), r3=154(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 153
LDI r2, 331
LDI r3, 154
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
