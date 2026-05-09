; DESCRIPTION: Composite: Places a white dot at position (408, 83) then Renders a magenta box of size 102x113 starting at (281, 49) then Draws a magenta circle centered at (124, 40) with radius 16.
; PLAN: r0=408(x), r1=83(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=281(x), r6=49(y), r7=102(width), r8=113(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=124(x), r11=40(y), r12=16(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 408
LDI r1, 83
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 281
LDI r6, 49
LDI r7, 102
LDI r8, 113
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 124
LDI r11, 40
LDI r12, 16
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
