; DESCRIPTION: Composite: Draws a green rectangle at (110, 60) with width 57 and height 27 then Creates a cyan circular shape at (125, 79) with radius 52.
; PLAN: r0=110(x), r1=60(y), r2=57(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=125(x), r6=79(y), r7=52(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 110
LDI r1, 60
LDI r2, 57
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 125
LDI r6, 79
LDI r7, 52
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
