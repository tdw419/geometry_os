; DESCRIPTION: Composite: Draws a magenta line from (278, 113) to (342, 69) then Creates a cyan rectangular region at (442, 21) spanning 49 by 115 pixels then Places a cyan dot at position (338, 226).
; PLAN: r0=278(x1), r1=113(y1), r2=342(x2), r3=69(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=442(x), r6=21(y), r7=49(width), r8=115(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=338(x), r11=226(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 278
LDI r1, 113
LDI r2, 342
LDI r3, 69
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 442
LDI r6, 21
LDI r7, 49
LDI r8, 115
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 338
LDI r11, 226
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
