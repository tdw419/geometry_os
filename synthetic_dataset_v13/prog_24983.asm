; DESCRIPTION: Composite: Creates a orange circular shape at (191, 60) with radius 50 then Places a white dot at position (467, 187) then Renders a purple line between points (234, 123) and (354, 161).
; PLAN: r0=191(x), r1=60(y), r2=50(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=467(x), r6=187(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=234(x1), r11=123(y1), r12=354(x2), r13=161(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 191
LDI r1, 60
LDI r2, 50
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 467
LDI r6, 187
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 234
LDI r11, 123
LDI r12, 354
LDI r13, 161
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
