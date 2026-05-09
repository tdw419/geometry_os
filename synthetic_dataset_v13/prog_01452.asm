; DESCRIPTION: Composite: Places a yellow circle of radius 27 at center (136, 220) then Draws a black line from (341, 7) to (15, 12) then Places a yellow dot at position (152, 156).
; PLAN: r0=136(x), r1=220(y), r2=27(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=341(x1), r6=7(y1), r7=15(x2), r8=12(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=152(x), r11=156(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 136
LDI r1, 220
LDI r2, 27
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 341
LDI r6, 7
LDI r7, 15
LDI r8, 12
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 152
LDI r11, 156
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
