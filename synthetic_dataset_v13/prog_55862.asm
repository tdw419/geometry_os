; DESCRIPTION: Composite: Places a white 27x17 rectangle at position (130, 114) then Places a cyan dot at position (409, 142) then Places a red circle of radius 51 at center (113, 149).
; PLAN: r0=130(x), r1=114(y), r2=27(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=409(x), r6=142(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=113(x), r11=149(y), r12=51(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 130
LDI r1, 114
LDI r2, 27
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 409
LDI r6, 142
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 113
LDI r11, 149
LDI r12, 51
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
