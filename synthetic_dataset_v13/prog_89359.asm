; DESCRIPTION: Composite: Creates a purple circular shape at (212, 79) with radius 75 then Draws a green rectangle at (317, 98) with width 72 and height 39.
; PLAN: r0=212(x), r1=79(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=317(x), r6=98(y), r7=72(width), r8=39(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 212
LDI r1, 79
LDI r2, 75
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 317
LDI r6, 98
LDI r7, 72
LDI r8, 39
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
