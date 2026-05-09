; DESCRIPTION: Composite: Renders a cyan disk with center (280, 155) and radius 27 then Creates a yellow rectangular region at (290, 182) spanning 19 by 18 pixels.
; PLAN: r0=280(x), r1=155(y), r2=27(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=290(x), r6=182(y), r7=19(width), r8=18(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 280
LDI r1, 155
LDI r2, 27
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 290
LDI r6, 182
LDI r7, 19
LDI r8, 18
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
