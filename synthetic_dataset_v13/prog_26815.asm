; DESCRIPTION: Composite: Places a white circle of radius 30 at center (448, 47) then Places a green dot at position (421, 41) then Renders a green box of size 13x116 starting at (486, 6).
; PLAN: r0=448(x), r1=47(y), r2=30(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=421(x), r6=41(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=486(x), r11=6(y), r12=13(width), r13=116(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 448
LDI r1, 47
LDI r2, 30
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 421
LDI r6, 41
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 486
LDI r11, 6
LDI r12, 13
LDI r13, 116
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
