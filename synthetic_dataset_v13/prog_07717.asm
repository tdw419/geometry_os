; DESCRIPTION: Composite: Draws a green line from (81, 28) to (282, 233) then Renders a red disk with center (406, 199) and radius 45 then Places a orange dot at position (380, 191).
; PLAN: r0=81(x1), r1=28(y1), r2=282(x2), r3=233(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=406(x), r6=199(y), r7=45(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=380(x), r11=191(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 81
LDI r1, 28
LDI r2, 282
LDI r3, 233
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 406
LDI r6, 199
LDI r7, 45
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 380
LDI r11, 191
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
