; DESCRIPTION: Composite: Places a cyan dot at position (91, 38) then Renders a purple disk with center (473, 195) and radius 12 then Draws a orange rectangle at (345, 19) with width 102 and height 89.
; PLAN: r0=91(x), r1=38(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=473(x), r6=195(y), r7=12(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=345(x), r11=19(y), r12=102(width), r13=89(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 91
LDI r1, 38
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 473
LDI r6, 195
LDI r7, 12
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 345
LDI r11, 19
LDI r12, 102
LDI r13, 89
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
