; DESCRIPTION: Composite: Creates a green rectangular region at (207, 179) spanning 102 by 32 pixels then Draws a cyan circle centered at (127, 150) with radius 39 then Places a blue dot at position (292, 160).
; PLAN: r0=207(x), r1=179(y), r2=102(width), r3=32(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=127(x), r6=150(y), r7=39(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=292(x), r11=160(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 207
LDI r1, 179
LDI r2, 102
LDI r3, 32
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 127
LDI r6, 150
LDI r7, 39
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 292
LDI r11, 160
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
