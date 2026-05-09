; DESCRIPTION: Composite: Sets a single green pixel at (197, 86) then Creates a cyan circular shape at (57, 197) with radius 41 then Renders a magenta box of size 10x25 starting at (147, 183).
; PLAN: r0=197(x), r1=86(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=57(x), r6=197(y), r7=41(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=147(x), r11=183(y), r12=10(width), r13=25(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 197
LDI r1, 86
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 57
LDI r6, 197
LDI r7, 41
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 147
LDI r11, 183
LDI r12, 10
LDI r13, 25
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
