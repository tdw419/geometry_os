; DESCRIPTION: Composite: Places a black 91x117 rectangle at position (333, 20) then Creates a yellow circular shape at (153, 99) with radius 30.
; PLAN: r0=333(x), r1=20(y), r2=91(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=153(x), r6=99(y), r7=30(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 333
LDI r1, 20
LDI r2, 91
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 153
LDI r6, 99
LDI r7, 30
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
