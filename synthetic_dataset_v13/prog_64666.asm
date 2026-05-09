; DESCRIPTION: Composite: Renders a yellow line between points (164, 66) and (383, 57) then Places a cyan dot at position (440, 89) then Renders a purple box of size 59x14 starting at (17, 143).
; PLAN: r0=164(x1), r1=66(y1), r2=383(x2), r3=57(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=440(x), r6=89(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=17(x), r11=143(y), r12=59(width), r13=14(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 164
LDI r1, 66
LDI r2, 383
LDI r3, 57
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 440
LDI r6, 89
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 17
LDI r11, 143
LDI r12, 59
LDI r13, 14
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
