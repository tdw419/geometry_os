; DESCRIPTION: Composite: Places a black dot at position (110, 166) then Places a black circle of radius 41 at center (380, 141) then Renders a green box of size 60x65 starting at (293, 63).
; PLAN: r0=110(x), r1=166(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=380(x), r6=141(y), r7=41(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=293(x), r11=63(y), r12=60(width), r13=65(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 110
LDI r1, 166
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 380
LDI r6, 141
LDI r7, 41
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 293
LDI r11, 63
LDI r12, 60
LDI r13, 65
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
