; DESCRIPTION: Composite: Draws a green line from (151, 127) to (327, 64) then Places a cyan dot at position (278, 53) then Renders a purple disk with center (415, 195) and radius 23.
; PLAN: r0=151(x1), r1=127(y1), r2=327(x2), r3=64(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=278(x), r6=53(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=415(x), r11=195(y), r12=23(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 151
LDI r1, 127
LDI r2, 327
LDI r3, 64
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 278
LDI r6, 53
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 415
LDI r11, 195
LDI r12, 23
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
