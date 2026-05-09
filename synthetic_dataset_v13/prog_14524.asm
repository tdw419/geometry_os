; DESCRIPTION: Composite: Places a blue dot at position (357, 119) then Creates a yellow circular shape at (146, 86) with radius 71.
; PLAN: r0=357(x), r1=119(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=146(x), r6=86(y), r7=71(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 357
LDI r1, 119
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 146
LDI r6, 86
LDI r7, 71
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
