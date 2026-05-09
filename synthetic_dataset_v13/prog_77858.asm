; DESCRIPTION: Composite: Draws a blue line from (176, 176) to (197, 127) then Places a green 60x24 rectangle at position (100, 56) then Places a yellow dot at position (418, 162).
; PLAN: r0=176(x1), r1=176(y1), r2=197(x2), r3=127(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=100(x), r6=56(y), r7=60(width), r8=24(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=418(x), r11=162(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 176
LDI r1, 176
LDI r2, 197
LDI r3, 127
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 100
LDI r6, 56
LDI r7, 60
LDI r8, 24
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 418
LDI r11, 162
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
