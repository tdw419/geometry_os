; DESCRIPTION: Draws a black line from (96, 69) to (463, 154).
; PLAN: r0=96(x1), r1=69(y1), r2=463(x2), r3=154(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 69
LDI r2, 463
LDI r3, 154
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
