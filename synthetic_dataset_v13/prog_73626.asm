; DESCRIPTION: Composite: Draws a magenta rectangle at (451, 1) with width 53 and height 96 then Places a cyan line segment connecting (190, 128) to (34, 230).
; PLAN: r0=451(x), r1=1(y), r2=53(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=190(x1), r6=128(y1), r7=34(x2), r8=230(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 451
LDI r1, 1
LDI r2, 53
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 190
LDI r6, 128
LDI r7, 34
LDI r8, 230
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
