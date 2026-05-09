; DESCRIPTION: Composite: Creates a cyan circular shape at (166, 62) with radius 57 then Places a cyan dot at position (393, 41) then Draws a white line from (244, 134) to (150, 234).
; PLAN: r0=166(x), r1=62(y), r2=57(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=393(x), r6=41(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=244(x1), r11=134(y1), r12=150(x2), r13=234(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 166
LDI r1, 62
LDI r2, 57
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 393
LDI r6, 41
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 244
LDI r11, 134
LDI r12, 150
LDI r13, 234
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
