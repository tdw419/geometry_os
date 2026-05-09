; DESCRIPTION: Draws a yellow line from (57, 189) to (344, 242).
; PLAN: r0=57(x1), r1=189(y1), r2=344(x2), r3=242(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 189
LDI r2, 344
LDI r3, 242
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
