; DESCRIPTION: Composite: Creates a purple circular shape at (326, 176) with radius 64 then Places a yellow 119x86 rectangle at position (300, 69) then Places a green dot at position (224, 119).
; PLAN: r0=326(x), r1=176(y), r2=64(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=300(x), r6=69(y), r7=119(width), r8=86(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=224(x), r11=119(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 326
LDI r1, 176
LDI r2, 64
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 300
LDI r6, 69
LDI r7, 119
LDI r8, 86
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 224
LDI r11, 119
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
