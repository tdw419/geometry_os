; DESCRIPTION: Composite: Places a blue 64x96 rectangle at position (373, 156) then Creates a orange circular shape at (242, 129) with radius 76.
; PLAN: r0=373(x), r1=156(y), r2=64(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=242(x), r6=129(y), r7=76(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 373
LDI r1, 156
LDI r2, 64
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 242
LDI r6, 129
LDI r7, 76
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
