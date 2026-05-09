; DESCRIPTION: Composite: Places a orange line segment connecting (371, 215) to (160, 19) then Places a red dot at position (345, 197) then Draws a yellow rectangle at (168, 96) with width 75 and height 100.
; PLAN: r0=371(x1), r1=215(y1), r2=160(x2), r3=19(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=345(x), r6=197(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=168(x), r11=96(y), r12=75(width), r13=100(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 371
LDI r1, 215
LDI r2, 160
LDI r3, 19
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 345
LDI r6, 197
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 168
LDI r11, 96
LDI r12, 75
LDI r13, 100
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
