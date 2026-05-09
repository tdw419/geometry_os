; DESCRIPTION: Composite: Places a cyan dot at position (326, 193) then Renders a green disk with center (309, 139) and radius 24 then Renders a yellow box of size 13x37 starting at (25, 199).
; PLAN: r0=326(x), r1=193(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=309(x), r6=139(y), r7=24(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=25(x), r11=199(y), r12=13(width), r13=37(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 326
LDI r1, 193
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 309
LDI r6, 139
LDI r7, 24
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 25
LDI r11, 199
LDI r12, 13
LDI r13, 37
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
