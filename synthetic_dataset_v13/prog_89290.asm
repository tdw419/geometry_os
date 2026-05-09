; DESCRIPTION: Composite: Creates a blue rectangular region at (296, 111) spanning 44 by 37 pixels then Places a white dot at position (345, 125).
; PLAN: r0=296(x), r1=111(y), r2=44(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=345(x), r6=125(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 296
LDI r1, 111
LDI r2, 44
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 345
LDI r6, 125
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
