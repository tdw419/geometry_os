; DESCRIPTION: Composite: Places a magenta 62x78 rectangle at position (278, 149) then Renders a green line between points (165, 131) and (307, 172) then Places a green dot at position (150, 188).
; PLAN: r0=278(x), r1=149(y), r2=62(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=165(x1), r6=131(y1), r7=307(x2), r8=172(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=150(x), r11=188(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 278
LDI r1, 149
LDI r2, 62
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 165
LDI r6, 131
LDI r7, 307
LDI r8, 172
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 150
LDI r11, 188
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
