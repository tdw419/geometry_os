; DESCRIPTION: Composite: Draws a cyan rectangle at (113, 33) with width 102 and height 44 then Places a cyan dot at position (252, 82) then Renders a black disk with center (344, 161) and radius 52.
; PLAN: r0=113(x), r1=33(y), r2=102(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=252(x), r6=82(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=344(x), r11=161(y), r12=52(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 113
LDI r1, 33
LDI r2, 102
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 252
LDI r6, 82
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 344
LDI r11, 161
LDI r12, 52
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
