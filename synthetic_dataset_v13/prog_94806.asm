; DESCRIPTION: Composite: Places a orange dot at position (272, 160) then Renders a cyan box of size 110x35 starting at (56, 66) then Places a orange circle of radius 20 at center (176, 51).
; PLAN: r0=272(x), r1=160(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=56(x), r6=66(y), r7=110(width), r8=35(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=176(x), r11=51(y), r12=20(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 272
LDI r1, 160
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 56
LDI r6, 66
LDI r7, 110
LDI r8, 35
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 176
LDI r11, 51
LDI r12, 20
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
