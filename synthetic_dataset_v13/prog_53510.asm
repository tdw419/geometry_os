; DESCRIPTION: Draws a yellow line from (256, 109) to (102, 222).
; PLAN: r0=256(x1), r1=109(y1), r2=102(x2), r3=222(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 109
LDI r2, 102
LDI r3, 222
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
