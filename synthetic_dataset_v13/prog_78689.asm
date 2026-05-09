; DESCRIPTION: Composite: Creates a cyan rectangular region at (77, 77) spanning 36 by 48 pixels then Draws a magenta circle centered at (336, 191) with radius 42 then Places a purple dot at position (66, 32).
; PLAN: r0=77(x), r1=77(y), r2=36(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=336(x), r6=191(y), r7=42(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=66(x), r11=32(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 77
LDI r1, 77
LDI r2, 36
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 336
LDI r6, 191
LDI r7, 42
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 66
LDI r11, 32
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
