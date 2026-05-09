; DESCRIPTION: Composite: Draws a red circle centered at (321, 151) with radius 19 then Places a white 23x15 rectangle at position (27, 240).
; PLAN: r0=321(x), r1=151(y), r2=19(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=27(x), r6=240(y), r7=23(width), r8=15(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 321
LDI r1, 151
LDI r2, 19
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 27
LDI r6, 240
LDI r7, 23
LDI r8, 15
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
