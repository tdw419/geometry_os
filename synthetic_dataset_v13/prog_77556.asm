; DESCRIPTION: Composite: Renders a green box of size 44x102 starting at (449, 15) then Draws a green line from (377, 220) to (197, 86) then Places a green circle of radius 10 at center (165, 131).
; PLAN: r0=449(x), r1=15(y), r2=44(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=377(x1), r6=220(y1), r7=197(x2), r8=86(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=165(x), r11=131(y), r12=10(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 449
LDI r1, 15
LDI r2, 44
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 377
LDI r6, 220
LDI r7, 197
LDI r8, 86
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 165
LDI r11, 131
LDI r12, 10
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
