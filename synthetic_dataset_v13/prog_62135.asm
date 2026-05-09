; DESCRIPTION: Composite: Places a cyan 107x72 rectangle at position (374, 99) then Places a yellow circle of radius 35 at center (68, 140).
; PLAN: r0=374(x), r1=99(y), r2=107(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=68(x), r6=140(y), r7=35(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 374
LDI r1, 99
LDI r2, 107
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 68
LDI r6, 140
LDI r7, 35
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
