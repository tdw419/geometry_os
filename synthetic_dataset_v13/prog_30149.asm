; DESCRIPTION: Composite: Renders a cyan box of size 87x23 starting at (373, 57) then Sets a single orange pixel at (7, 232) then Creates a red circular shape at (433, 164) with radius 18.
; PLAN: r0=373(x), r1=57(y), r2=87(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=7(x), r6=232(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=433(x), r11=164(y), r12=18(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 373
LDI r1, 57
LDI r2, 87
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 7
LDI r6, 232
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 433
LDI r11, 164
LDI r12, 18
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
