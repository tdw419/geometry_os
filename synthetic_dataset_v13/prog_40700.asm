; DESCRIPTION: Draws a black line from (64, 175) to (34, 154).
; PLAN: r0=64(x1), r1=175(y1), r2=34(x2), r3=154(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 175
LDI r2, 34
LDI r3, 154
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
