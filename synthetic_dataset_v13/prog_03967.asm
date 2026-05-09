; DESCRIPTION: Composite: Sets a single magenta pixel at (497, 172) then Renders a white line between points (272, 10) and (364, 155) then Places a green 111x70 rectangle at position (108, 39).
; PLAN: r0=497(x), r1=172(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=272(x1), r6=10(y1), r7=364(x2), r8=155(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=108(x), r11=39(y), r12=111(width), r13=70(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 497
LDI r1, 172
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 272
LDI r6, 10
LDI r7, 364
LDI r8, 155
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 108
LDI r11, 39
LDI r12, 111
LDI r13, 70
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
