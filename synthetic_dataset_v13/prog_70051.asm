; DESCRIPTION: Composite: Draws a yellow line from (71, 127) to (73, 52) then Places a purple 30x59 rectangle at position (463, 0) then Places a blue dot at position (482, 232).
; PLAN: r0=71(x1), r1=127(y1), r2=73(x2), r3=52(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=463(x), r6=0(y), r7=30(width), r8=59(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=482(x), r11=232(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 71
LDI r1, 127
LDI r2, 73
LDI r3, 52
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 463
LDI r6, 0
LDI r7, 30
LDI r8, 59
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 482
LDI r11, 232
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
