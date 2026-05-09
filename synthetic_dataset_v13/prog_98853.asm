; DESCRIPTION: Composite: Places a magenta circle of radius 23 at center (305, 182) then Draws a white rectangle at (35, 16) with width 72 and height 55 then Sets a single black pixel at (392, 98).
; PLAN: r0=305(x), r1=182(y), r2=23(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=35(x), r6=16(y), r7=72(width), r8=55(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=392(x), r11=98(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 305
LDI r1, 182
LDI r2, 23
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 35
LDI r6, 16
LDI r7, 72
LDI r8, 55
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 392
LDI r11, 98
LDI r12, 0x000000
PSET r10, r11, r12
HALT
