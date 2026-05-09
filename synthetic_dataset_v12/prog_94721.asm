; DESCRIPTION: Draws a yellow line from (251, 242) to (73, 28).
; PLAN: r0=251(x1), r1=242(y1), r2=73(x2), r3=28(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 242
LDI r2, 73
LDI r3, 28
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
