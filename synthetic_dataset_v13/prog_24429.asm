; DESCRIPTION: Draws a yellow line from (73, 188) to (96, 154).
; PLAN: r0=73(x1), r1=188(y1), r2=96(x2), r3=154(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 188
LDI r2, 96
LDI r3, 154
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
