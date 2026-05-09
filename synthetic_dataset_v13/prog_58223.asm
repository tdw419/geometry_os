; DESCRIPTION: Composite: Creates a magenta circular shape at (83, 105) with radius 42 then Renders a blue box of size 25x15 starting at (6, 1) then Sets a single red pixel at (335, 151).
; PLAN: r0=83(x), r1=105(y), r2=42(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=6(x), r6=1(y), r7=25(width), r8=15(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=335(x), r11=151(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 83
LDI r1, 105
LDI r2, 42
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 6
LDI r6, 1
LDI r7, 25
LDI r8, 15
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 335
LDI r11, 151
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
