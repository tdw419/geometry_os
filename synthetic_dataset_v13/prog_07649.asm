; DESCRIPTION: Composite: Draws a yellow circle centered at (383, 174) with radius 58 then Draws a cyan rectangle at (294, 15) with width 81 and height 44 then Sets a single orange pixel at (332, 242).
; PLAN: r0=383(x), r1=174(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=294(x), r6=15(y), r7=81(width), r8=44(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=332(x), r11=242(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 383
LDI r1, 174
LDI r2, 58
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 294
LDI r6, 15
LDI r7, 81
LDI r8, 44
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 332
LDI r11, 242
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
