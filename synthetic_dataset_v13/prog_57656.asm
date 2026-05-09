; DESCRIPTION: Composite: Creates a yellow rectangular region at (19, 2) spanning 87 by 90 pixels then Draws a yellow line from (367, 254) to (67, 108) then Places a blue dot at position (373, 125).
; PLAN: r0=19(x), r1=2(y), r2=87(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=367(x1), r6=254(y1), r7=67(x2), r8=108(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=373(x), r11=125(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 19
LDI r1, 2
LDI r2, 87
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 367
LDI r6, 254
LDI r7, 67
LDI r8, 108
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 373
LDI r11, 125
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
