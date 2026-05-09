; DESCRIPTION: Composite: Places a blue circle of radius 61 at center (161, 77) then Draws a white rectangle at (51, 47) with width 104 and height 102 then Places a cyan dot at position (452, 22).
; PLAN: r0=161(x), r1=77(y), r2=61(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=51(x), r6=47(y), r7=104(width), r8=102(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=452(x), r11=22(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 161
LDI r1, 77
LDI r2, 61
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 51
LDI r6, 47
LDI r7, 104
LDI r8, 102
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 452
LDI r11, 22
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
