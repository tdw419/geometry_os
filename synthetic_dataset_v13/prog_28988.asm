; DESCRIPTION: Composite: Sets a single orange pixel at (495, 66) then Places a black 40x79 rectangle at position (41, 13) then Places a red circle of radius 24 at center (262, 160).
; PLAN: r0=495(x), r1=66(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=41(x), r6=13(y), r7=40(width), r8=79(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=262(x), r11=160(y), r12=24(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 495
LDI r1, 66
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 41
LDI r6, 13
LDI r7, 40
LDI r8, 79
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 262
LDI r11, 160
LDI r12, 24
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
