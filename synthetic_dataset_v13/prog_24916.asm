; DESCRIPTION: Composite: Renders a red disk with center (364, 201) and radius 24 then Creates a cyan rectangular region at (90, 150) spanning 74 by 34 pixels.
; PLAN: r0=364(x), r1=201(y), r2=24(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=90(x), r6=150(y), r7=74(width), r8=34(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 364
LDI r1, 201
LDI r2, 24
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 90
LDI r6, 150
LDI r7, 74
LDI r8, 34
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
