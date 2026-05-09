; DESCRIPTION: Composite: Renders a cyan disk with center (16, 56) and radius 12 then Creates a orange rectangular region at (71, 28) spanning 81 by 104 pixels.
; PLAN: r0=16(x), r1=56(y), r2=12(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=71(x), r6=28(y), r7=81(width), r8=104(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 16
LDI r1, 56
LDI r2, 12
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 71
LDI r6, 28
LDI r7, 81
LDI r8, 104
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
