; DESCRIPTION: Composite: Renders a orange line between points (464, 203) and (211, 20) then Places a orange dot at position (437, 205) then Places a red circle of radius 74 at center (279, 164).
; PLAN: r0=464(x1), r1=203(y1), r2=211(x2), r3=20(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=437(x), r6=205(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=279(x), r11=164(y), r12=74(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 464
LDI r1, 203
LDI r2, 211
LDI r3, 20
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 437
LDI r6, 205
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 279
LDI r11, 164
LDI r12, 74
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
