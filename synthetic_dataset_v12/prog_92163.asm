; DESCRIPTION: Composite: Renders a green disk with center (294, 182) and radius 59 then Creates a yellow rectangular region at (73, 118) spanning 76 by 73 pixels.
; PLAN: r0=294(x), r1=182(y), r2=59(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=73(x), r6=118(y), r7=76(width), r8=73(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 294
LDI r1, 182
LDI r2, 59
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 73
LDI r6, 118
LDI r7, 76
LDI r8, 73
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
