; DESCRIPTION: Draws a orange circle centered at (242, 159) with radius 48.
; PLAN: r0=242(x), r1=159(y), r2=48(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 242
LDI r1, 159
LDI r2, 48
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
