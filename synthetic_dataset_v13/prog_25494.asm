; DESCRIPTION: Composite: Places a cyan 42x48 rectangle at position (23, 16) then Draws a cyan circle centered at (254, 142) with radius 66 then Sets a single magenta pixel at (294, 205).
; PLAN: r0=23(x), r1=16(y), r2=42(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=254(x), r6=142(y), r7=66(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=294(x), r11=205(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 23
LDI r1, 16
LDI r2, 42
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 254
LDI r6, 142
LDI r7, 66
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 294
LDI r11, 205
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
