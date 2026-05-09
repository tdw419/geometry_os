; DESCRIPTION: Composite: Places a green dot at position (401, 117) then Renders a orange disk with center (380, 58) and radius 19 then Places a black 53x31 rectangle at position (29, 205).
; PLAN: r0=401(x), r1=117(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=380(x), r6=58(y), r7=19(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=29(x), r11=205(y), r12=53(width), r13=31(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 401
LDI r1, 117
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 380
LDI r6, 58
LDI r7, 19
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 29
LDI r11, 205
LDI r12, 53
LDI r13, 31
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
