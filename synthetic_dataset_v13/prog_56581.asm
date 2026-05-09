; DESCRIPTION: Draws a magenta line from (269, 242) to (323, 92).
; PLAN: r0=269(x1), r1=242(y1), r2=323(x2), r3=92(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 242
LDI r2, 323
LDI r3, 92
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
