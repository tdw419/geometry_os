; DESCRIPTION: Composite: Renders a orange box of size 48x57 starting at (206, 52) then Creates a green circular shape at (318, 125) with radius 21.
; PLAN: r0=206(x), r1=52(y), r2=48(width), r3=57(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=318(x), r6=125(y), r7=21(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 206
LDI r1, 52
LDI r2, 48
LDI r3, 57
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 318
LDI r6, 125
LDI r7, 21
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
