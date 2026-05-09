; DESCRIPTION: Draws a yellow line from (379, 242) to (175, 170).
; PLAN: r0=379(x1), r1=242(y1), r2=175(x2), r3=170(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 242
LDI r2, 175
LDI r3, 170
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
