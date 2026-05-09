; DESCRIPTION: Composite: Places a cyan circle of radius 13 at center (224, 96) then Creates a black rectangular region at (16, 129) spanning 117 by 60 pixels.
; PLAN: r0=224(x), r1=96(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=16(x), r6=129(y), r7=117(width), r8=60(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 224
LDI r1, 96
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 16
LDI r6, 129
LDI r7, 117
LDI r8, 60
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
