; DESCRIPTION: Composite: Draws a orange rectangle at (45, 162) with width 72 and height 27 then Sets a single cyan pixel at (445, 220) then Draws a black circle centered at (61, 157) with radius 60.
; PLAN: r0=45(x), r1=162(y), r2=72(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=445(x), r6=220(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=61(x), r11=157(y), r12=60(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 45
LDI r1, 162
LDI r2, 72
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 445
LDI r6, 220
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 61
LDI r11, 157
LDI r12, 60
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
