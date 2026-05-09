; DESCRIPTION: Composite: Places a red circle of radius 77 at center (274, 159) then Places a yellow 103x83 rectangle at position (383, 122).
; PLAN: r0=274(x), r1=159(y), r2=77(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=383(x), r6=122(y), r7=103(width), r8=83(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 274
LDI r1, 159
LDI r2, 77
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 383
LDI r6, 122
LDI r7, 103
LDI r8, 83
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
