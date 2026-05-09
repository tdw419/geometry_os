; DESCRIPTION: Composite: Places a cyan circle of radius 51 at center (285, 86) then Draws a black rectangle at (305, 152) with width 117 and height 45 then Sets a single orange pixel at (316, 68).
; PLAN: r0=285(x), r1=86(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=305(x), r6=152(y), r7=117(width), r8=45(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=316(x), r11=68(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 285
LDI r1, 86
LDI r2, 51
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 305
LDI r6, 152
LDI r7, 117
LDI r8, 45
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 316
LDI r11, 68
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
