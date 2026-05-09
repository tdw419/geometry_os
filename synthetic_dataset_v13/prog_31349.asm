; DESCRIPTION: Composite: Renders a green line between points (354, 101) and (207, 117) then Places a cyan dot at position (433, 104) then Draws a cyan circle centered at (187, 114) with radius 71.
; PLAN: r0=354(x1), r1=101(y1), r2=207(x2), r3=117(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=433(x), r6=104(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=187(x), r11=114(y), r12=71(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 354
LDI r1, 101
LDI r2, 207
LDI r3, 117
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 433
LDI r6, 104
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 187
LDI r11, 114
LDI r12, 71
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
