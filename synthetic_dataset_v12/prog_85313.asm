; DESCRIPTION: Composite: Places a yellow circle of radius 10 at center (76, 182) then Creates a red rectangular region at (133, 4) spanning 90 by 112 pixels then Places a orange dot at position (428, 215).
; PLAN: r0=76(x), r1=182(y), r2=10(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=133(x), r6=4(y), r7=90(width), r8=112(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=428(x), r11=215(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 76
LDI r1, 182
LDI r2, 10
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 133
LDI r6, 4
LDI r7, 90
LDI r8, 112
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 428
LDI r11, 215
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
