; DESCRIPTION: Composite: Sets a single red pixel at (69, 231) then Draws a magenta circle centered at (194, 163) with radius 45 then Renders a cyan box of size 19x21 starting at (307, 20).
; PLAN: r0=69(x), r1=231(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=194(x), r6=163(y), r7=45(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=307(x), r11=20(y), r12=19(width), r13=21(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 69
LDI r1, 231
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 194
LDI r6, 163
LDI r7, 45
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 307
LDI r11, 20
LDI r12, 19
LDI r13, 21
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
