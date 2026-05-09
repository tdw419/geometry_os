; DESCRIPTION: Composite: Draws a magenta circle centered at (288, 125) with radius 22 then Renders a blue box of size 56x100 starting at (44, 36) then Places a cyan line segment connecting (248, 90) to (294, 27).
; PLAN: r0=288(x), r1=125(y), r2=22(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=44(x), r6=36(y), r7=56(width), r8=100(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=248(x1), r11=90(y1), r12=294(x2), r13=27(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 288
LDI r1, 125
LDI r2, 22
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 44
LDI r6, 36
LDI r7, 56
LDI r8, 100
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 248
LDI r11, 90
LDI r12, 294
LDI r13, 27
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
