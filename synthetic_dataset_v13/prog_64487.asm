; DESCRIPTION: Composite: Renders a cyan disk with center (303, 141) and radius 77 then Creates a yellow rectangular region at (142, 56) spanning 42 by 106 pixels.
; PLAN: r0=303(x), r1=141(y), r2=77(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=142(x), r6=56(y), r7=42(width), r8=106(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 303
LDI r1, 141
LDI r2, 77
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 142
LDI r6, 56
LDI r7, 42
LDI r8, 106
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
