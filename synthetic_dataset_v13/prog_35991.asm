; DESCRIPTION: Composite: Places a white circle of radius 69 at center (422, 164) then Creates a red rectangular region at (170, 66) spanning 37 by 56 pixels then Places a white dot at position (123, 174).
; PLAN: r0=422(x), r1=164(y), r2=69(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=170(x), r6=66(y), r7=37(width), r8=56(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=123(x), r11=174(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 422
LDI r1, 164
LDI r2, 69
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 170
LDI r6, 66
LDI r7, 37
LDI r8, 56
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 123
LDI r11, 174
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
