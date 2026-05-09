; DESCRIPTION: Composite: Sets a single cyan pixel at (494, 195) then Places a green circle of radius 31 at center (307, 67) then Renders a cyan box of size 66x60 starting at (264, 45).
; PLAN: r0=494(x), r1=195(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=307(x), r6=67(y), r7=31(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=264(x), r11=45(y), r12=66(width), r13=60(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 494
LDI r1, 195
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 307
LDI r6, 67
LDI r7, 31
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 264
LDI r11, 45
LDI r12, 66
LDI r13, 60
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
