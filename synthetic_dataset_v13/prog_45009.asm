; DESCRIPTION: Composite: Places a purple circle of radius 70 at center (146, 87) then Creates a black rectangular region at (364, 70) spanning 30 by 60 pixels.
; PLAN: r0=146(x), r1=87(y), r2=70(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=364(x), r6=70(y), r7=30(width), r8=60(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 146
LDI r1, 87
LDI r2, 70
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 364
LDI r6, 70
LDI r7, 30
LDI r8, 60
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
