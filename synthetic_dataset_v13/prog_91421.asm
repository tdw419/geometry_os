; DESCRIPTION: Composite: Creates a green circular shape at (172, 189) with radius 47 then Places a white dot at position (161, 120) then Places a green 68x94 rectangle at position (121, 23).
; PLAN: r0=172(x), r1=189(y), r2=47(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=161(x), r6=120(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=121(x), r11=23(y), r12=68(width), r13=94(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 172
LDI r1, 189
LDI r2, 47
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 161
LDI r6, 120
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 121
LDI r11, 23
LDI r12, 68
LDI r13, 94
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
