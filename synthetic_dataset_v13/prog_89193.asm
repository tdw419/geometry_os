; DESCRIPTION: Draws a yellow line from (144, 242) to (156, 46).
; PLAN: r0=144(x1), r1=242(y1), r2=156(x2), r3=46(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 242
LDI r2, 156
LDI r3, 46
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
