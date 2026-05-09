; DESCRIPTION: Renders a yellow line between points (222, 38) and (354, 28).
; PLAN: r0=222(x1), r1=38(y1), r2=354(x2), r3=28(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 38
LDI r2, 354
LDI r3, 28
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
