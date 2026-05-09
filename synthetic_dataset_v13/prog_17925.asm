; DESCRIPTION: Composite: Renders a magenta box of size 88x86 starting at (128, 48) then Places a green circle of radius 76 at center (294, 170).
; PLAN: r0=128(x), r1=48(y), r2=88(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=294(x), r6=170(y), r7=76(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 128
LDI r1, 48
LDI r2, 88
LDI r3, 86
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 294
LDI r6, 170
LDI r7, 76
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
