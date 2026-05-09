; DESCRIPTION: Composite: Sets a single orange pixel at (497, 155) then Renders a orange box of size 102x10 starting at (57, 127) then Places a red circle of radius 13 at center (18, 207).
; PLAN: r0=497(x), r1=155(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=57(x), r6=127(y), r7=102(width), r8=10(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=18(x), r11=207(y), r12=13(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 497
LDI r1, 155
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 57
LDI r6, 127
LDI r7, 102
LDI r8, 10
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 18
LDI r11, 207
LDI r12, 13
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
