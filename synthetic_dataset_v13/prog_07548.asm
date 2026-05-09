; DESCRIPTION: Composite: Renders a green disk with center (258, 146) and radius 61 then Creates a magenta rectangular region at (73, 87) spanning 22 by 61 pixels then Places a magenta dot at position (104, 166).
; PLAN: r0=258(x), r1=146(y), r2=61(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=73(x), r6=87(y), r7=22(width), r8=61(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=104(x), r11=166(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 258
LDI r1, 146
LDI r2, 61
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 73
LDI r6, 87
LDI r7, 22
LDI r8, 61
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 104
LDI r11, 166
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
