; DESCRIPTION: Composite: Places a white 46x77 rectangle at position (151, 131) then Renders a black disk with center (424, 129) and radius 53 then Places a yellow dot at position (440, 158).
; PLAN: r0=151(x), r1=131(y), r2=46(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=424(x), r6=129(y), r7=53(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=440(x), r11=158(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 151
LDI r1, 131
LDI r2, 46
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 424
LDI r6, 129
LDI r7, 53
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 440
LDI r11, 158
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
