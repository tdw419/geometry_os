; DESCRIPTION: Composite: Renders a yellow disk with center (327, 151) and radius 40 then Renders a yellow line between points (88, 130) and (493, 207) then Places a black dot at position (98, 108).
; PLAN: r0=327(x), r1=151(y), r2=40(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=88(x1), r6=130(y1), r7=493(x2), r8=207(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=98(x), r11=108(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 327
LDI r1, 151
LDI r2, 40
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 88
LDI r6, 130
LDI r7, 493
LDI r8, 207
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 98
LDI r11, 108
LDI r12, 0x000000
PSET r10, r11, r12
HALT
