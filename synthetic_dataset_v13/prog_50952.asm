; DESCRIPTION: Composite: Places a magenta circle of radius 67 at center (107, 91) then Places a yellow dot at position (372, 114).
; PLAN: r0=107(x), r1=91(y), r2=67(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=372(x), r6=114(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 107
LDI r1, 91
LDI r2, 67
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 372
LDI r6, 114
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
