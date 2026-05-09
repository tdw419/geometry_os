; DESCRIPTION: Composite: Places a cyan line segment connecting (110, 160) to (310, 149) then Sets a single cyan pixel at (225, 197) then Renders a purple box of size 111x84 starting at (59, 17).
; PLAN: r0=110(x1), r1=160(y1), r2=310(x2), r3=149(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=225(x), r6=197(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=59(x), r11=17(y), r12=111(width), r13=84(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 110
LDI r1, 160
LDI r2, 310
LDI r3, 149
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 225
LDI r6, 197
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 59
LDI r11, 17
LDI r12, 111
LDI r13, 84
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
