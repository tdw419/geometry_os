; DESCRIPTION: Composite: Renders a yellow box of size 63x16 starting at (200, 202) then Places a magenta dot at position (343, 83) then Creates a cyan circular shape at (297, 93) with radius 11.
; PLAN: r0=200(x), r1=202(y), r2=63(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=343(x), r6=83(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=297(x), r11=93(y), r12=11(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 200
LDI r1, 202
LDI r2, 63
LDI r3, 16
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 343
LDI r6, 83
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 297
LDI r11, 93
LDI r12, 11
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
