; DESCRIPTION: Composite: Renders a red disk with center (266, 133) and radius 74 then Creates a yellow rectangular region at (224, 90) spanning 72 by 44 pixels.
; PLAN: r0=266(x), r1=133(y), r2=74(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=224(x), r6=90(y), r7=72(width), r8=44(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 266
LDI r1, 133
LDI r2, 74
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 224
LDI r6, 90
LDI r7, 72
LDI r8, 44
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
