; DESCRIPTION: Composite: Places a orange circle of radius 27 at center (94, 115) then Renders a green box of size 52x104 starting at (277, 34) then Sets a single black pixel at (430, 209).
; PLAN: r0=94(x), r1=115(y), r2=27(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=277(x), r6=34(y), r7=52(width), r8=104(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=430(x), r11=209(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 94
LDI r1, 115
LDI r2, 27
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 277
LDI r6, 34
LDI r7, 52
LDI r8, 104
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 430
LDI r11, 209
LDI r12, 0x000000
PSET r10, r11, r12
HALT
