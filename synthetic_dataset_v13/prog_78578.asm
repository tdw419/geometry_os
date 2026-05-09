; DESCRIPTION: Composite: Draws a purple rectangle at (339, 82) with width 21 and height 16 then Sets a single green pixel at (237, 136) then Draws a cyan line from (393, 159) to (57, 96).
; PLAN: r0=339(x), r1=82(y), r2=21(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=237(x), r6=136(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=393(x1), r11=159(y1), r12=57(x2), r13=96(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 339
LDI r1, 82
LDI r2, 21
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 237
LDI r6, 136
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 393
LDI r11, 159
LDI r12, 57
LDI r13, 96
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
