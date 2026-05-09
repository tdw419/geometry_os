; DESCRIPTION: Composite: Places a magenta circle of radius 64 at center (352, 155) then Places a yellow dot at position (283, 223).
; PLAN: r0=352(x), r1=155(y), r2=64(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=283(x), r6=223(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 352
LDI r1, 155
LDI r2, 64
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 283
LDI r6, 223
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
