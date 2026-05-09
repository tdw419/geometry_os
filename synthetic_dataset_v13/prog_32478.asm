; DESCRIPTION: Composite: Draws a green circle centered at (445, 156) with radius 58 then Places a white 115x107 rectangle at position (382, 98).
; PLAN: r0=445(x), r1=156(y), r2=58(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=382(x), r6=98(y), r7=115(width), r8=107(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 445
LDI r1, 156
LDI r2, 58
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 382
LDI r6, 98
LDI r7, 115
LDI r8, 107
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
