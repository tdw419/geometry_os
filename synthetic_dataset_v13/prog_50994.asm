; DESCRIPTION: Composite: Draws a cyan rectangle at (337, 93) with width 77 and height 83 then Creates a orange circular shape at (42, 174) with radius 20 then Sets a single black pixel at (305, 160).
; PLAN: r0=337(x), r1=93(y), r2=77(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=42(x), r6=174(y), r7=20(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=305(x), r11=160(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 337
LDI r1, 93
LDI r2, 77
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 42
LDI r6, 174
LDI r7, 20
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 305
LDI r11, 160
LDI r12, 0x000000
PSET r10, r11, r12
HALT
