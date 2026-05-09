; DESCRIPTION: Composite: Renders a blue disk with center (278, 103) and radius 27 then Places a orange 52x36 rectangle at position (216, 110) then Places a orange dot at position (133, 45).
; PLAN: r0=278(x), r1=103(y), r2=27(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=216(x), r6=110(y), r7=52(width), r8=36(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=133(x), r11=45(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 278
LDI r1, 103
LDI r2, 27
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 216
LDI r6, 110
LDI r7, 52
LDI r8, 36
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 133
LDI r11, 45
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
