; DESCRIPTION: Draws a yellow line from (1, 8) to (117, 154).
; PLAN: r0=1(x1), r1=8(y1), r2=117(x2), r3=154(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 8
LDI r2, 117
LDI r3, 154
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
