; DESCRIPTION: Draws a blue line from (28, 49) to (37, 154).
; PLAN: r0=28(x1), r1=49(y1), r2=37(x2), r3=154(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 49
LDI r2, 37
LDI r3, 154
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
