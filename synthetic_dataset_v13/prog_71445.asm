; DESCRIPTION: Composite: Places a green dot at position (488, 164) then Places a white 15x63 rectangle at position (130, 77) then Renders a white disk with center (107, 70) and radius 41.
; PLAN: r0=488(x), r1=164(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=130(x), r6=77(y), r7=15(width), r8=63(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=107(x), r11=70(y), r12=41(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 488
LDI r1, 164
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 130
LDI r6, 77
LDI r7, 15
LDI r8, 63
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 107
LDI r11, 70
LDI r12, 41
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
