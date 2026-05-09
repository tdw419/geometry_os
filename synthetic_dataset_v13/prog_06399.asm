; DESCRIPTION: Composite: Places a white dot at position (374, 206) then Places a magenta circle of radius 70 at center (312, 156).
; PLAN: r0=374(x), r1=206(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=312(x), r6=156(y), r7=70(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 374
LDI r1, 206
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 312
LDI r6, 156
LDI r7, 70
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
