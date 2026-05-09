; DESCRIPTION: Composite: Renders a white disk with center (337, 151) and radius 57 then Draws a orange line from (2, 53) to (375, 107) then Sets a single purple pixel at (223, 114).
; PLAN: r0=337(x), r1=151(y), r2=57(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=2(x1), r6=53(y1), r7=375(x2), r8=107(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=223(x), r11=114(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 337
LDI r1, 151
LDI r2, 57
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 2
LDI r6, 53
LDI r7, 375
LDI r8, 107
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 223
LDI r11, 114
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
