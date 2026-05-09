; DESCRIPTION: Composite: Places a magenta circle of radius 53 at center (387, 83) then Places a cyan line segment connecting (405, 234) to (34, 66) then Draws a orange rectangle at (452, 166) with width 16 and height 68.
; PLAN: r0=387(x), r1=83(y), r2=53(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=405(x1), r6=234(y1), r7=34(x2), r8=66(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=452(x), r11=166(y), r12=16(width), r13=68(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 387
LDI r1, 83
LDI r2, 53
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 405
LDI r6, 234
LDI r7, 34
LDI r8, 66
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 452
LDI r11, 166
LDI r12, 16
LDI r13, 68
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
