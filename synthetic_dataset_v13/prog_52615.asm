; DESCRIPTION: Draws a orange circle centered at (242, 36) with radius 18.
; PLAN: r0=242(x), r1=36(y), r2=18(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 242
LDI r1, 36
LDI r2, 18
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
