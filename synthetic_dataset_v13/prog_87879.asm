; DESCRIPTION: Composite: Draws a magenta line from (449, 213) to (255, 52) then Places a orange 54x77 rectangle at position (443, 142) then Places a yellow circle of radius 33 at center (197, 158).
; PLAN: r0=449(x1), r1=213(y1), r2=255(x2), r3=52(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=443(x), r6=142(y), r7=54(width), r8=77(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=197(x), r11=158(y), r12=33(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 449
LDI r1, 213
LDI r2, 255
LDI r3, 52
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 443
LDI r6, 142
LDI r7, 54
LDI r8, 77
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 197
LDI r11, 158
LDI r12, 33
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
