; DESCRIPTION: Composite: Places a yellow 82x74 rectangle at position (36, 87) then Places a orange dot at position (240, 10) then Places a green circle of radius 39 at center (370, 138).
; PLAN: r0=36(x), r1=87(y), r2=82(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=240(x), r6=10(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=370(x), r11=138(y), r12=39(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 36
LDI r1, 87
LDI r2, 82
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 240
LDI r6, 10
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 370
LDI r11, 138
LDI r12, 39
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
