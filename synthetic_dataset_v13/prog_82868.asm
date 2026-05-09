; DESCRIPTION: Composite: Renders a white disk with center (389, 126) and radius 42 then Renders a green box of size 46x31 starting at (234, 121) then Sets a single black pixel at (133, 212).
; PLAN: r0=389(x), r1=126(y), r2=42(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=234(x), r6=121(y), r7=46(width), r8=31(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=133(x), r11=212(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 389
LDI r1, 126
LDI r2, 42
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 234
LDI r6, 121
LDI r7, 46
LDI r8, 31
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 133
LDI r11, 212
LDI r12, 0x000000
PSET r10, r11, r12
HALT
