; DESCRIPTION: Draws a yellow line from (373, 242) to (426, 21).
; PLAN: r0=373(x1), r1=242(y1), r2=426(x2), r3=21(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 242
LDI r2, 426
LDI r3, 21
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
