; DESCRIPTION: Draws a yellow line from (26, 242) to (60, 31).
; PLAN: r0=26(x1), r1=242(y1), r2=60(x2), r3=31(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 242
LDI r2, 60
LDI r3, 31
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
