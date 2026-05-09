; DESCRIPTION: Draws a yellow circle centered at (242, 78) with radius 75.
; PLAN: r0=242(x), r1=78(y), r2=75(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 242
LDI r1, 78
LDI r2, 75
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
