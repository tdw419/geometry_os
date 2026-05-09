; DESCRIPTION: Composite: Places a green circle of radius 37 at center (361, 111) then Places a red 25x118 rectangle at position (340, 114) then Places a yellow dot at position (258, 164).
; PLAN: r0=361(x), r1=111(y), r2=37(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=340(x), r6=114(y), r7=25(width), r8=118(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=258(x), r11=164(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 361
LDI r1, 111
LDI r2, 37
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 340
LDI r6, 114
LDI r7, 25
LDI r8, 118
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 258
LDI r11, 164
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
