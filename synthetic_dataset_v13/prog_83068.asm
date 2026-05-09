; DESCRIPTION: Composite: Places a cyan 23x40 rectangle at position (190, 154) then Places a blue line segment connecting (383, 59) to (197, 230) then Renders a black disk with center (252, 134) and radius 59.
; PLAN: r0=190(x), r1=154(y), r2=23(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=383(x1), r6=59(y1), r7=197(x2), r8=230(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=252(x), r11=134(y), r12=59(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 190
LDI r1, 154
LDI r2, 23
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 383
LDI r6, 59
LDI r7, 197
LDI r8, 230
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 252
LDI r11, 134
LDI r12, 59
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
