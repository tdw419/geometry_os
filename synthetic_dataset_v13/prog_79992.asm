; DESCRIPTION: Composite: Draws a red circle centered at (79, 197) with radius 50 then Sets a single blue pixel at (236, 126) then Draws a magenta rectangle at (231, 81) with width 107 and height 120.
; PLAN: r0=79(x), r1=197(y), r2=50(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=236(x), r6=126(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=231(x), r11=81(y), r12=107(width), r13=120(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 79
LDI r1, 197
LDI r2, 50
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 236
LDI r6, 126
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 231
LDI r11, 81
LDI r12, 107
LDI r13, 120
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
