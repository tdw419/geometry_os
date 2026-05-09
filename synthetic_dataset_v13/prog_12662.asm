; DESCRIPTION: Composite: Renders a magenta box of size 10x95 starting at (430, 84) then Places a magenta circle of radius 20 at center (258, 96) then Sets a single cyan pixel at (57, 47).
; PLAN: r0=430(x), r1=84(y), r2=10(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=258(x), r6=96(y), r7=20(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=57(x), r11=47(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 430
LDI r1, 84
LDI r2, 10
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 258
LDI r6, 96
LDI r7, 20
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 57
LDI r11, 47
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
