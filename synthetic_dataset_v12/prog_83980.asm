; DESCRIPTION: Composite: Sets a single cyan pixel at (69, 122) then Places a magenta circle of radius 24 at center (257, 57) then Renders a magenta box of size 108x38 starting at (66, 7).
; PLAN: r0=69(x), r1=122(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=257(x), r6=57(y), r7=24(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=66(x), r11=7(y), r12=108(width), r13=38(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 69
LDI r1, 122
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 257
LDI r6, 57
LDI r7, 24
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 66
LDI r11, 7
LDI r12, 108
LDI r13, 38
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
