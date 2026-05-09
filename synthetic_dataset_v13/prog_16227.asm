; DESCRIPTION: Composite: Creates a yellow circular shape at (61, 49) with radius 46 then Renders a blue box of size 49x103 starting at (287, 37) then Places a red line segment connecting (346, 97) to (380, 102).
; PLAN: r0=61(x), r1=49(y), r2=46(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=287(x), r6=37(y), r7=49(width), r8=103(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=346(x1), r11=97(y1), r12=380(x2), r13=102(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 61
LDI r1, 49
LDI r2, 46
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 287
LDI r6, 37
LDI r7, 49
LDI r8, 103
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 346
LDI r11, 97
LDI r12, 380
LDI r13, 102
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
