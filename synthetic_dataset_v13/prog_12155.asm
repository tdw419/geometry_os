; DESCRIPTION: Composite: Creates a cyan circular shape at (312, 151) with radius 36 then Renders a yellow box of size 92x109 starting at (343, 89) then Places a yellow line segment connecting (197, 110) to (328, 43).
; PLAN: r0=312(x), r1=151(y), r2=36(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=343(x), r6=89(y), r7=92(width), r8=109(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=197(x1), r11=110(y1), r12=328(x2), r13=43(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 312
LDI r1, 151
LDI r2, 36
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 343
LDI r6, 89
LDI r7, 92
LDI r8, 109
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 197
LDI r11, 110
LDI r12, 328
LDI r13, 43
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
