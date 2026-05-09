; DESCRIPTION: Composite: Creates a orange circular shape at (207, 141) with radius 39 then Places a magenta dot at position (79, 37).
; PLAN: r0=207(x), r1=141(y), r2=39(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=79(x), r6=37(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 207
LDI r1, 141
LDI r2, 39
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 79
LDI r6, 37
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
