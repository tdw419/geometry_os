; DESCRIPTION: Draws a yellow circle centered at (328, 127) with radius 54.
; PLAN: r0=328(x), r1=127(y), r2=54(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 328
LDI r1, 127
LDI r2, 54
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
