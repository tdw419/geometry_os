; DESCRIPTION: Draws a green line from (214, 175) to (4, 163).
; PLAN: r0=214(x1), r1=175(y1), r2=4(x2), r3=163(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 175
LDI r2, 4
LDI r3, 163
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
