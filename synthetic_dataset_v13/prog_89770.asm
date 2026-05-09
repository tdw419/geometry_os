; DESCRIPTION: Composite: Draws a black line from (171, 210) to (94, 45) then Draws a orange circle centered at (197, 145) with radius 68 then Places a yellow dot at position (67, 132).
; PLAN: r0=171(x1), r1=210(y1), r2=94(x2), r3=45(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=197(x), r6=145(y), r7=68(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=67(x), r11=132(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 171
LDI r1, 210
LDI r2, 94
LDI r3, 45
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 197
LDI r6, 145
LDI r7, 68
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 67
LDI r11, 132
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
