; DESCRIPTION: Composite: Creates a green circular shape at (437, 178) with radius 61 then Draws a yellow rectangle at (371, 65) with width 75 and height 93.
; PLAN: r0=437(x), r1=178(y), r2=61(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=371(x), r6=65(y), r7=75(width), r8=93(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 437
LDI r1, 178
LDI r2, 61
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 371
LDI r6, 65
LDI r7, 75
LDI r8, 93
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
