; DESCRIPTION: Composite: Creates a cyan circular shape at (245, 23) with radius 10 then Creates a blue rectangular region at (385, 152) spanning 52 by 95 pixels.
; PLAN: r0=245(x), r1=23(y), r2=10(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=385(x), r6=152(y), r7=52(width), r8=95(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 245
LDI r1, 23
LDI r2, 10
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 385
LDI r6, 152
LDI r7, 52
LDI r8, 95
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
