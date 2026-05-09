; DESCRIPTION: Composite: Places a magenta circle of radius 61 at center (324, 176) then Draws a cyan rectangle at (432, 22) with width 36 and height 19 then Places a green line segment connecting (214, 93) to (208, 103).
; PLAN: r0=324(x), r1=176(y), r2=61(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=432(x), r6=22(y), r7=36(width), r8=19(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=214(x1), r11=93(y1), r12=208(x2), r13=103(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 324
LDI r1, 176
LDI r2, 61
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 432
LDI r6, 22
LDI r7, 36
LDI r8, 19
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 214
LDI r11, 93
LDI r12, 208
LDI r13, 103
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
