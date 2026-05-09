; DESCRIPTION: Composite: Renders a cyan disk with center (324, 99) and radius 35 then Places a magenta dot at position (474, 134) then Renders a white line between points (172, 2) and (490, 10).
; PLAN: r0=324(x), r1=99(y), r2=35(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=474(x), r6=134(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=172(x1), r11=2(y1), r12=490(x2), r13=10(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 324
LDI r1, 99
LDI r2, 35
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 474
LDI r6, 134
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 172
LDI r11, 2
LDI r12, 490
LDI r13, 10
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
