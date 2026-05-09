; DESCRIPTION: Draws a yellow circle centered at (231, 190) with radius 47.
; PLAN: r0=231(x), r1=190(y), r2=47(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 231
LDI r1, 190
LDI r2, 47
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
