; DESCRIPTION: Composite: Renders a red disk with center (283, 226) and radius 11 then Creates a yellow rectangular region at (321, 70) spanning 91 by 109 pixels.
; PLAN: r0=283(x), r1=226(y), r2=11(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=321(x), r6=70(y), r7=91(width), r8=109(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 283
LDI r1, 226
LDI r2, 11
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 321
LDI r6, 70
LDI r7, 91
LDI r8, 109
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
