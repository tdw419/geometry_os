; DESCRIPTION: Composite: Draws a magenta circle centered at (217, 190) with radius 48 then Renders a orange box of size 94x84 starting at (176, 24) then Sets a single orange pixel at (222, 164).
; PLAN: r0=217(x), r1=190(y), r2=48(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=176(x), r6=24(y), r7=94(width), r8=84(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=222(x), r11=164(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 217
LDI r1, 190
LDI r2, 48
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 176
LDI r6, 24
LDI r7, 94
LDI r8, 84
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 222
LDI r11, 164
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
