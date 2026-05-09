; DESCRIPTION: Composite: Renders a orange box of size 108x91 starting at (262, 40) then Renders a orange disk with center (277, 94) and radius 14 then Places a cyan dot at position (136, 126).
; PLAN: r0=262(x), r1=40(y), r2=108(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=277(x), r6=94(y), r7=14(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=136(x), r11=126(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 262
LDI r1, 40
LDI r2, 108
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 277
LDI r6, 94
LDI r7, 14
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 136
LDI r11, 126
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
