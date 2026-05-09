; DESCRIPTION: Composite: Creates a black circular shape at (108, 101) with radius 66 then Places a magenta line segment connecting (433, 130) to (111, 146) then Renders a blue box of size 30x19 starting at (444, 71).
; PLAN: r0=108(x), r1=101(y), r2=66(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=433(x1), r6=130(y1), r7=111(x2), r8=146(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=444(x), r11=71(y), r12=30(width), r13=19(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 108
LDI r1, 101
LDI r2, 66
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 433
LDI r6, 130
LDI r7, 111
LDI r8, 146
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 444
LDI r11, 71
LDI r12, 30
LDI r13, 19
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
