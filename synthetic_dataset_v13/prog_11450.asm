; DESCRIPTION: Composite: Draws a magenta rectangle at (119, 52) with width 81 and height 100 then Places a magenta circle of radius 64 at center (383, 108) then Draws a cyan line from (19, 37) to (323, 161).
; PLAN: r0=119(x), r1=52(y), r2=81(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=383(x), r6=108(y), r7=64(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=19(x1), r11=37(y1), r12=323(x2), r13=161(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 119
LDI r1, 52
LDI r2, 81
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 383
LDI r6, 108
LDI r7, 64
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 19
LDI r11, 37
LDI r12, 323
LDI r13, 161
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
