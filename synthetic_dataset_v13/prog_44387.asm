; DESCRIPTION: Composite: Places a purple circle of radius 32 at center (224, 80) then Places a blue 83x82 rectangle at position (124, 113) then Places a green dot at position (61, 140).
; PLAN: r0=224(x), r1=80(y), r2=32(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=124(x), r6=113(y), r7=83(width), r8=82(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=61(x), r11=140(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 224
LDI r1, 80
LDI r2, 32
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 124
LDI r6, 113
LDI r7, 83
LDI r8, 82
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 61
LDI r11, 140
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
