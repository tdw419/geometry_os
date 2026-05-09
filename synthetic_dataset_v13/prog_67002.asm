; DESCRIPTION: Composite: Renders a white line between points (392, 20) and (361, 22) then Renders a white disk with center (44, 141) and radius 37 then Draws a black rectangle at (386, 45) with width 113 and height 108.
; PLAN: r0=392(x1), r1=20(y1), r2=361(x2), r3=22(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=44(x), r6=141(y), r7=37(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=386(x), r11=45(y), r12=113(width), r13=108(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 392
LDI r1, 20
LDI r2, 361
LDI r3, 22
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 44
LDI r6, 141
LDI r7, 37
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 386
LDI r11, 45
LDI r12, 113
LDI r13, 108
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
