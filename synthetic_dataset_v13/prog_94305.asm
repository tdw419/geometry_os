; DESCRIPTION: Composite: Sets a single orange pixel at (477, 228) then Renders a yellow box of size 118x28 starting at (169, 32) then Renders a green disk with center (240, 71) and radius 49.
; PLAN: r0=477(x), r1=228(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=169(x), r6=32(y), r7=118(width), r8=28(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=240(x), r11=71(y), r12=49(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 477
LDI r1, 228
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 169
LDI r6, 32
LDI r7, 118
LDI r8, 28
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 240
LDI r11, 71
LDI r12, 49
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
