; DESCRIPTION: Composite: Places a white dot at position (287, 144) then Renders a purple line between points (4, 240) and (174, 232) then Places a cyan 60x94 rectangle at position (223, 28).
; PLAN: r0=287(x), r1=144(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=4(x1), r6=240(y1), r7=174(x2), r8=232(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=223(x), r11=28(y), r12=60(width), r13=94(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 287
LDI r1, 144
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 4
LDI r6, 240
LDI r7, 174
LDI r8, 232
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 223
LDI r11, 28
LDI r12, 60
LDI r13, 94
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
