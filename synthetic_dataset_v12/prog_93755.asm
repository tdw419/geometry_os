; DESCRIPTION: Composite: Draws a yellow circle centered at (151, 37) with radius 22 then Renders a cyan box of size 21x64 starting at (417, 74).
; PLAN: r0=151(x), r1=37(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=417(x), r6=74(y), r7=21(width), r8=64(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 151
LDI r1, 37
LDI r2, 22
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 417
LDI r6, 74
LDI r7, 21
LDI r8, 64
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
