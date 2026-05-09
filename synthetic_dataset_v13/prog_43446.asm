; DESCRIPTION: Composite: Draws a green line from (264, 61) to (73, 76) then Places a yellow dot at position (187, 7) then Renders a white box of size 41x89 starting at (223, 3).
; PLAN: r0=264(x1), r1=61(y1), r2=73(x2), r3=76(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=187(x), r6=7(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=223(x), r11=3(y), r12=41(width), r13=89(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 264
LDI r1, 61
LDI r2, 73
LDI r3, 76
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 187
LDI r6, 7
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 223
LDI r11, 3
LDI r12, 41
LDI r13, 89
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
