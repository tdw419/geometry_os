; DESCRIPTION: Composite: Creates a magenta circular shape at (306, 187) with radius 63 then Places a red dot at position (248, 248).
; PLAN: r0=306(x), r1=187(y), r2=63(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=248(x), r6=248(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 306
LDI r1, 187
LDI r2, 63
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 248
LDI r6, 248
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
