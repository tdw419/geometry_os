; DESCRIPTION: Renders a yellow line between points (256, 117) and (301, 222).
; PLAN: r0=256(x1), r1=117(y1), r2=301(x2), r3=222(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 117
LDI r2, 301
LDI r3, 222
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
