; DESCRIPTION: Composite: Places a black circle of radius 21 at center (45, 165) then Renders a white line between points (304, 7) and (391, 67) then Renders a green box of size 60x98 starting at (393, 58).
; PLAN: r0=45(x), r1=165(y), r2=21(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=304(x1), r6=7(y1), r7=391(x2), r8=67(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=393(x), r11=58(y), r12=60(width), r13=98(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 45
LDI r1, 165
LDI r2, 21
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 304
LDI r6, 7
LDI r7, 391
LDI r8, 67
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 393
LDI r11, 58
LDI r12, 60
LDI r13, 98
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
