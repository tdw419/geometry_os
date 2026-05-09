; DESCRIPTION: Composite: Places a red circle of radius 27 at center (44, 147) then Places a red 105x11 rectangle at position (30, 105).
; PLAN: r0=44(x), r1=147(y), r2=27(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=30(x), r6=105(y), r7=105(width), r8=11(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 44
LDI r1, 147
LDI r2, 27
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 30
LDI r6, 105
LDI r7, 105
LDI r8, 11
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
