; DESCRIPTION: Draws a yellow circle centered at (242, 18) with radius 18.
; PLAN: r0=242(x), r1=18(y), r2=18(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 242
LDI r1, 18
LDI r2, 18
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
