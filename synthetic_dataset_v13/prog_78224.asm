; DESCRIPTION: Composite: Creates a cyan rectangular region at (290, 118) spanning 40 by 89 pixels then Sets a single orange pixel at (440, 96) then Draws a red circle centered at (397, 187) with radius 25.
; PLAN: r0=290(x), r1=118(y), r2=40(width), r3=89(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=440(x), r6=96(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=397(x), r11=187(y), r12=25(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 290
LDI r1, 118
LDI r2, 40
LDI r3, 89
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 440
LDI r6, 96
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 397
LDI r11, 187
LDI r12, 25
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
