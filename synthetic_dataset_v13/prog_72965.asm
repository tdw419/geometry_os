; DESCRIPTION: Composite: Renders a purple disk with center (89, 155) and radius 60 then Creates a orange rectangular region at (272, 166) spanning 108 by 89 pixels.
; PLAN: r0=89(x), r1=155(y), r2=60(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=272(x), r6=166(y), r7=108(width), r8=89(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 89
LDI r1, 155
LDI r2, 60
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 272
LDI r6, 166
LDI r7, 108
LDI r8, 89
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
