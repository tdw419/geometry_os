; DESCRIPTION: Draws a yellow line from (468, 153) to (461, 154).
; PLAN: r0=468(x1), r1=153(y1), r2=461(x2), r3=154(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 153
LDI r2, 461
LDI r3, 154
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
