; DESCRIPTION: Composite: Renders a blue box of size 111x58 starting at (123, 159) then Draws a green line from (371, 219) to (212, 106) then Sets a single purple pixel at (498, 243).
; PLAN: r0=123(x), r1=159(y), r2=111(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=371(x1), r6=219(y1), r7=212(x2), r8=106(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=498(x), r11=243(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 123
LDI r1, 159
LDI r2, 111
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 371
LDI r6, 219
LDI r7, 212
LDI r8, 106
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 498
LDI r11, 243
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
