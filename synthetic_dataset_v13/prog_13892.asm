; DESCRIPTION: Composite: Creates a cyan rectangular region at (112, 188) spanning 95 by 64 pixels then Creates a magenta circular shape at (24, 189) with radius 14 then Sets a single purple pixel at (446, 231).
; PLAN: r0=112(x), r1=188(y), r2=95(width), r3=64(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=24(x), r6=189(y), r7=14(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=446(x), r11=231(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 112
LDI r1, 188
LDI r2, 95
LDI r3, 64
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 24
LDI r6, 189
LDI r7, 14
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 446
LDI r11, 231
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
