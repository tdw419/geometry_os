; DESCRIPTION: Composite: Creates a cyan rectangular region at (418, 58) spanning 62 by 103 pixels then Places a blue circle of radius 79 at center (267, 172) then Places a cyan dot at position (417, 133).
; PLAN: r0=418(x), r1=58(y), r2=62(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=267(x), r6=172(y), r7=79(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=417(x), r11=133(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 418
LDI r1, 58
LDI r2, 62
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 267
LDI r6, 172
LDI r7, 79
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 417
LDI r11, 133
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
