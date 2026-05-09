; DESCRIPTION: Composite: Draws a red circle centered at (193, 34) with radius 26 then Creates a cyan rectangular region at (345, 52) spanning 98 by 60 pixels then Sets a single red pixel at (75, 4).
; PLAN: r0=193(x), r1=34(y), r2=26(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=345(x), r6=52(y), r7=98(width), r8=60(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=75(x), r11=4(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 193
LDI r1, 34
LDI r2, 26
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 345
LDI r6, 52
LDI r7, 98
LDI r8, 60
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 75
LDI r11, 4
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
