; DESCRIPTION: Composite: Creates a red circular shape at (124, 68) with radius 17 then Creates a blue rectangular region at (168, 147) spanning 47 by 109 pixels.
; PLAN: r0=124(x), r1=68(y), r2=17(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=168(x), r6=147(y), r7=47(width), r8=109(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 124
LDI r1, 68
LDI r2, 17
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 168
LDI r6, 147
LDI r7, 47
LDI r8, 109
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
