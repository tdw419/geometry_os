; DESCRIPTION: Composite: Creates a cyan rectangular region at (73, 81) spanning 72 by 52 pixels then Creates a magenta circular shape at (265, 173) with radius 25 then Places a yellow dot at position (208, 49).
; PLAN: r0=73(x), r1=81(y), r2=72(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=265(x), r6=173(y), r7=25(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=208(x), r11=49(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 73
LDI r1, 81
LDI r2, 72
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 265
LDI r6, 173
LDI r7, 25
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 208
LDI r11, 49
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
