; DESCRIPTION: Composite: Places a red 82x94 rectangle at position (401, 17) then Places a white dot at position (162, 122) then Renders a red disk with center (261, 180) and radius 72.
; PLAN: r0=401(x), r1=17(y), r2=82(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=162(x), r6=122(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=261(x), r11=180(y), r12=72(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 401
LDI r1, 17
LDI r2, 82
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 162
LDI r6, 122
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 261
LDI r11, 180
LDI r12, 72
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
