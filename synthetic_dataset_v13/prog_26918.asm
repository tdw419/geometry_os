; DESCRIPTION: Composite: Creates a cyan rectangular region at (346, 80) spanning 114 by 97 pixels then Places a yellow dot at position (479, 136) then Places a purple line segment connecting (18, 198) to (193, 17).
; PLAN: r0=346(x), r1=80(y), r2=114(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=479(x), r6=136(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=18(x1), r11=198(y1), r12=193(x2), r13=17(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 346
LDI r1, 80
LDI r2, 114
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 479
LDI r6, 136
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 18
LDI r11, 198
LDI r12, 193
LDI r13, 17
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
