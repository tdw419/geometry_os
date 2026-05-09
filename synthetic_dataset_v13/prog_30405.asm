; DESCRIPTION: Composite: Draws a red circle centered at (129, 176) with radius 31 then Places a cyan 48x44 rectangle at position (441, 65).
; PLAN: r0=129(x), r1=176(y), r2=31(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=441(x), r6=65(y), r7=48(width), r8=44(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 129
LDI r1, 176
LDI r2, 31
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 441
LDI r6, 65
LDI r7, 48
LDI r8, 44
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
