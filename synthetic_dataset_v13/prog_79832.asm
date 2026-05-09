; DESCRIPTION: Composite: Draws a purple circle centered at (117, 65) with radius 53 then Renders a white line between points (276, 191) and (508, 67) then Places a black dot at position (299, 208).
; PLAN: r0=117(x), r1=65(y), r2=53(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=276(x1), r6=191(y1), r7=508(x2), r8=67(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=299(x), r11=208(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 117
LDI r1, 65
LDI r2, 53
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 276
LDI r6, 191
LDI r7, 508
LDI r8, 67
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 299
LDI r11, 208
LDI r12, 0x000000
PSET r10, r11, r12
HALT
