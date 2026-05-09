; DESCRIPTION: Composite: Places a green dot at position (11, 71) then Places a white 107x91 rectangle at position (396, 13) then Draws a green line from (69, 255) to (257, 2).
; PLAN: r0=11(x), r1=71(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=396(x), r6=13(y), r7=107(width), r8=91(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=69(x1), r11=255(y1), r12=257(x2), r13=2(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 11
LDI r1, 71
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 396
LDI r6, 13
LDI r7, 107
LDI r8, 91
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 69
LDI r11, 255
LDI r12, 257
LDI r13, 2
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
