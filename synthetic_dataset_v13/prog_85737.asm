; DESCRIPTION: Composite: Places a white line segment connecting (472, 126) to (411, 56) then Draws a magenta circle centered at (83, 202) with radius 46 then Places a green dot at position (113, 151).
; PLAN: r0=472(x1), r1=126(y1), r2=411(x2), r3=56(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=83(x), r6=202(y), r7=46(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=113(x), r11=151(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 472
LDI r1, 126
LDI r2, 411
LDI r3, 56
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 83
LDI r6, 202
LDI r7, 46
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 113
LDI r11, 151
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
