; DESCRIPTION: Composite: Places a purple 97x15 rectangle at position (136, 20) then Renders a magenta line between points (329, 40) and (313, 87) then Places a green dot at position (491, 24).
; PLAN: r0=136(x), r1=20(y), r2=97(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=329(x1), r6=40(y1), r7=313(x2), r8=87(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=491(x), r11=24(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 136
LDI r1, 20
LDI r2, 97
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 329
LDI r6, 40
LDI r7, 313
LDI r8, 87
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 491
LDI r11, 24
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
