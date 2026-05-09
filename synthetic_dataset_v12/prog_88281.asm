; DESCRIPTION: Composite: Renders a green disk with center (109, 146) and radius 51 then Creates a cyan rectangular region at (332, 97) spanning 118 by 15 pixels.
; PLAN: r0=109(x), r1=146(y), r2=51(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=332(x), r6=97(y), r7=118(width), r8=15(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 109
LDI r1, 146
LDI r2, 51
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 332
LDI r6, 97
LDI r7, 118
LDI r8, 15
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
