; DESCRIPTION: Composite: Renders a orange disk with center (150, 195) and radius 53 then Places a magenta line segment connecting (138, 34) to (222, 161) then Sets a single black pixel at (434, 1).
; PLAN: r0=150(x), r1=195(y), r2=53(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=138(x1), r6=34(y1), r7=222(x2), r8=161(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=434(x), r11=1(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 150
LDI r1, 195
LDI r2, 53
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 138
LDI r6, 34
LDI r7, 222
LDI r8, 161
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 434
LDI r11, 1
LDI r12, 0x000000
PSET r10, r11, r12
HALT
