; DESCRIPTION: Composite: Draws a cyan rectangle at (89, 86) with width 57 and height 110 then Renders a green disk with center (367, 57) and radius 10.
; PLAN: r0=89(x), r1=86(y), r2=57(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=367(x), r6=57(y), r7=10(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 89
LDI r1, 86
LDI r2, 57
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 367
LDI r6, 57
LDI r7, 10
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
