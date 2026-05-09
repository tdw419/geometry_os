; DESCRIPTION: Composite: Renders a cyan box of size 12x80 starting at (272, 58) then Creates a yellow circular shape at (45, 221) with radius 11.
; PLAN: r0=272(x), r1=58(y), r2=12(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=45(x), r6=221(y), r7=11(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 272
LDI r1, 58
LDI r2, 12
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 45
LDI r6, 221
LDI r7, 11
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
