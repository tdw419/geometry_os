; DESCRIPTION: Composite: Renders a orange disk with center (387, 70) and radius 55 then Renders a black box of size 18x42 starting at (285, 134) then Places a orange dot at position (169, 4).
; PLAN: r0=387(x), r1=70(y), r2=55(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=285(x), r6=134(y), r7=18(width), r8=42(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=169(x), r11=4(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 387
LDI r1, 70
LDI r2, 55
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 285
LDI r6, 134
LDI r7, 18
LDI r8, 42
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 169
LDI r11, 4
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
