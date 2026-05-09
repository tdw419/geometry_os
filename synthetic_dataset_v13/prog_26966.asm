; DESCRIPTION: Composite: Creates a purple circular shape at (418, 147) with radius 62 then Places a black 38x120 rectangle at position (433, 78) then Sets a single orange pixel at (395, 57).
; PLAN: r0=418(x), r1=147(y), r2=62(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=433(x), r6=78(y), r7=38(width), r8=120(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=395(x), r11=57(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 418
LDI r1, 147
LDI r2, 62
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 433
LDI r6, 78
LDI r7, 38
LDI r8, 120
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 395
LDI r11, 57
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
