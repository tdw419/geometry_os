; DESCRIPTION: Composite: Renders a cyan line between points (366, 113) and (287, 6) then Renders a cyan disk with center (376, 160) and radius 26 then Creates a cyan rectangular region at (291, 129) spanning 100 by 120 pixels.
; PLAN: r0=366(x1), r1=113(y1), r2=287(x2), r3=6(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=376(x), r6=160(y), r7=26(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=291(x), r11=129(y), r12=100(width), r13=120(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 366
LDI r1, 113
LDI r2, 287
LDI r3, 6
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 376
LDI r6, 160
LDI r7, 26
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 291
LDI r11, 129
LDI r12, 100
LDI r13, 120
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
