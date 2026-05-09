; DESCRIPTION: Draws a yellow line from (481, 64) to (208, 154).
; PLAN: r0=481(x1), r1=64(y1), r2=208(x2), r3=154(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 64
LDI r2, 208
LDI r3, 154
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
