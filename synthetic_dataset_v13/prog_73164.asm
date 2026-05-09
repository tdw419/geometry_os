; DESCRIPTION: Composite: Renders a blue line between points (306, 80) and (145, 245) then Places a green 61x100 rectangle at position (324, 41) then Places a black circle of radius 16 at center (232, 213).
; PLAN: r0=306(x1), r1=80(y1), r2=145(x2), r3=245(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=324(x), r6=41(y), r7=61(width), r8=100(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=232(x), r11=213(y), r12=16(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 306
LDI r1, 80
LDI r2, 145
LDI r3, 245
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 324
LDI r6, 41
LDI r7, 61
LDI r8, 100
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 232
LDI r11, 213
LDI r12, 16
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
