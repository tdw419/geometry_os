; DESCRIPTION: Composite: Renders a purple box of size 91x56 starting at (368, 27) then Creates a cyan circular shape at (272, 83) with radius 18.
; PLAN: r0=368(x), r1=27(y), r2=91(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=272(x), r6=83(y), r7=18(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 368
LDI r1, 27
LDI r2, 91
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 272
LDI r6, 83
LDI r7, 18
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
