; DESCRIPTION: Composite: Creates a black circular shape at (284, 192) with radius 63 then Renders a red box of size 87x91 starting at (362, 144).
; PLAN: r0=284(x), r1=192(y), r2=63(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=362(x), r6=144(y), r7=87(width), r8=91(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 284
LDI r1, 192
LDI r2, 63
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 362
LDI r6, 144
LDI r7, 87
LDI r8, 91
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
