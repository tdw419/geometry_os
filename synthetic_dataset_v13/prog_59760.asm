; DESCRIPTION: Composite: Places a white dot at position (455, 133) then Places a black 65x50 rectangle at position (276, 120) then Draws a blue circle centered at (231, 38) with radius 11.
; PLAN: r0=455(x), r1=133(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=276(x), r6=120(y), r7=65(width), r8=50(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=231(x), r11=38(y), r12=11(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 455
LDI r1, 133
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 276
LDI r6, 120
LDI r7, 65
LDI r8, 50
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 231
LDI r11, 38
LDI r12, 11
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
