; DESCRIPTION: Composite: Renders a green disk with center (102, 137) and radius 54 then Creates a purple rectangular region at (68, 71) spanning 32 by 62 pixels.
; PLAN: r0=102(x), r1=137(y), r2=54(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=68(x), r6=71(y), r7=32(width), r8=62(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 102
LDI r1, 137
LDI r2, 54
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 68
LDI r6, 71
LDI r7, 32
LDI r8, 62
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
