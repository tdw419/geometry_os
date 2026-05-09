; DESCRIPTION: Composite: Creates a cyan circular shape at (422, 173) with radius 59 then Renders a green box of size 78x48 starting at (335, 156).
; PLAN: r0=422(x), r1=173(y), r2=59(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=335(x), r6=156(y), r7=78(width), r8=48(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 422
LDI r1, 173
LDI r2, 59
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 335
LDI r6, 156
LDI r7, 78
LDI r8, 48
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
