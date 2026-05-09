; DESCRIPTION: Composite: Sets a single white pixel at (105, 52) then Renders a green disk with center (366, 168) and radius 64.
; PLAN: r0=105(x), r1=52(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=366(x), r6=168(y), r7=64(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 105
LDI r1, 52
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 366
LDI r6, 168
LDI r7, 64
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
