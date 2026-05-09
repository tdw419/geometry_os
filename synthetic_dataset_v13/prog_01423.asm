; DESCRIPTION: Draws a yellow line from (92, 8) to (3, 192).
; PLAN: r0=92(x1), r1=8(y1), r2=3(x2), r3=192(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 8
LDI r2, 3
LDI r3, 192
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
