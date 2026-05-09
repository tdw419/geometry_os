; DESCRIPTION: Composite: Draws a cyan line from (260, 40) to (307, 237) then Sets a single purple pixel at (142, 250) then Places a orange 53x24 rectangle at position (396, 200).
; PLAN: r0=260(x1), r1=40(y1), r2=307(x2), r3=237(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=142(x), r6=250(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=396(x), r11=200(y), r12=53(width), r13=24(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 260
LDI r1, 40
LDI r2, 307
LDI r3, 237
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 142
LDI r6, 250
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 396
LDI r11, 200
LDI r12, 53
LDI r13, 24
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
