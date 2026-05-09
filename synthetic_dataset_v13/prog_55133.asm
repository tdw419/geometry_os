; DESCRIPTION: Composite: Draws a cyan circle centered at (152, 76) with radius 53 then Places a black dot at position (78, 180) then Draws a cyan line from (111, 158) to (488, 12).
; PLAN: r0=152(x), r1=76(y), r2=53(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=78(x), r6=180(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=111(x1), r11=158(y1), r12=488(x2), r13=12(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 152
LDI r1, 76
LDI r2, 53
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 78
LDI r6, 180
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 111
LDI r11, 158
LDI r12, 488
LDI r13, 12
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
