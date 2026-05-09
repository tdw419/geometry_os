; DESCRIPTION: Composite: Creates a magenta circular shape at (223, 129) with radius 80 then Places a black 87x54 rectangle at position (12, 185) then Sets a single yellow pixel at (42, 241).
; PLAN: r0=223(x), r1=129(y), r2=80(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=12(x), r6=185(y), r7=87(width), r8=54(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=42(x), r11=241(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 223
LDI r1, 129
LDI r2, 80
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 12
LDI r6, 185
LDI r7, 87
LDI r8, 54
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 42
LDI r11, 241
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
