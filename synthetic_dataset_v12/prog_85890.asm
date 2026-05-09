; DESCRIPTION: Draws a yellow circle centered at (333, 190) with radius 37.
; PLAN: r0=333(x), r1=190(y), r2=37(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 333
LDI r1, 190
LDI r2, 37
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
