; DESCRIPTION: Composite: Creates a cyan circular shape at (97, 152) with radius 13 then Renders a white box of size 16x118 starting at (385, 40) then Sets a single purple pixel at (256, 223).
; PLAN: r0=97(x), r1=152(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=385(x), r6=40(y), r7=16(width), r8=118(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=256(x), r11=223(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 97
LDI r1, 152
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 385
LDI r6, 40
LDI r7, 16
LDI r8, 118
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 256
LDI r11, 223
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
