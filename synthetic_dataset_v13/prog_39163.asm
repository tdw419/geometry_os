; DESCRIPTION: Composite: Draws a red rectangle at (21, 68) with width 44 and height 106 then Places a black line segment connecting (65, 215) to (84, 116) then Places a black dot at position (279, 83).
; PLAN: r0=21(x), r1=68(y), r2=44(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=65(x1), r6=215(y1), r7=84(x2), r8=116(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=279(x), r11=83(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 21
LDI r1, 68
LDI r2, 44
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 65
LDI r6, 215
LDI r7, 84
LDI r8, 116
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 279
LDI r11, 83
LDI r12, 0x000000
PSET r10, r11, r12
HALT
