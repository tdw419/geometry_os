; DESCRIPTION: Composite: Places a cyan circle of radius 26 at center (438, 65) then Sets a single cyan pixel at (213, 143) then Draws a white rectangle at (60, 147) with width 66 and height 81.
; PLAN: r0=438(x), r1=65(y), r2=26(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=213(x), r6=143(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=60(x), r11=147(y), r12=66(width), r13=81(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 438
LDI r1, 65
LDI r2, 26
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 213
LDI r6, 143
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 60
LDI r11, 147
LDI r12, 66
LDI r13, 81
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
