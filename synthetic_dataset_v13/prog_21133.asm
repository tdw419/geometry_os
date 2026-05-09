; DESCRIPTION: Composite: Places a white circle of radius 31 at center (213, 190) then Places a orange dot at position (367, 129) then Places a yellow 69x93 rectangle at position (381, 41).
; PLAN: r0=213(x), r1=190(y), r2=31(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=367(x), r6=129(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=381(x), r11=41(y), r12=69(width), r13=93(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 213
LDI r1, 190
LDI r2, 31
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 367
LDI r6, 129
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 381
LDI r11, 41
LDI r12, 69
LDI r13, 93
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
