; DESCRIPTION: Composite: Creates a yellow rectangular region at (276, 130) spanning 55 by 80 pixels then Places a purple line segment connecting (224, 195) to (70, 128).
; PLAN: r0=276(x), r1=130(y), r2=55(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=224(x1), r6=195(y1), r7=70(x2), r8=128(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 276
LDI r1, 130
LDI r2, 55
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 224
LDI r6, 195
LDI r7, 70
LDI r8, 128
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
