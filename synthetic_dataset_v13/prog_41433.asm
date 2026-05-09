; DESCRIPTION: Composite: Creates a green rectangular region at (111, 3) spanning 42 by 48 pixels then Creates a red circular shape at (231, 210) with radius 30 then Sets a single purple pixel at (149, 2).
; PLAN: r0=111(x), r1=3(y), r2=42(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=231(x), r6=210(y), r7=30(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=149(x), r11=2(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 111
LDI r1, 3
LDI r2, 42
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 231
LDI r6, 210
LDI r7, 30
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 149
LDI r11, 2
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
