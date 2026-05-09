; DESCRIPTION: Composite: Draws a magenta rectangle at (265, 53) with width 68 and height 104 then Places a black line segment connecting (433, 251) to (247, 21) then Places a red circle of radius 16 at center (73, 213).
; PLAN: r0=265(x), r1=53(y), r2=68(width), r3=104(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=433(x1), r6=251(y1), r7=247(x2), r8=21(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=73(x), r11=213(y), r12=16(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 265
LDI r1, 53
LDI r2, 68
LDI r3, 104
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 433
LDI r6, 251
LDI r7, 247
LDI r8, 21
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 73
LDI r11, 213
LDI r12, 16
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
