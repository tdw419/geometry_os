; DESCRIPTION: Composite: Renders a green box of size 17x56 starting at (224, 194) then Creates a orange circular shape at (114, 129) with radius 72.
; PLAN: r0=224(x), r1=194(y), r2=17(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=114(x), r6=129(y), r7=72(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 224
LDI r1, 194
LDI r2, 17
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 114
LDI r6, 129
LDI r7, 72
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
