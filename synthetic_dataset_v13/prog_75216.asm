; DESCRIPTION: Composite: Renders a white disk with center (329, 53) and radius 52 then Places a purple 67x16 rectangle at position (24, 101) then Places a orange dot at position (328, 141).
; PLAN: r0=329(x), r1=53(y), r2=52(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=24(x), r6=101(y), r7=67(width), r8=16(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=328(x), r11=141(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 329
LDI r1, 53
LDI r2, 52
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 24
LDI r6, 101
LDI r7, 67
LDI r8, 16
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 328
LDI r11, 141
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
