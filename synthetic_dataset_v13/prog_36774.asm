; DESCRIPTION: Composite: Places a blue 85x100 rectangle at position (241, 146) then Creates a cyan circular shape at (111, 70) with radius 41 then Places a blue line segment connecting (73, 98) to (191, 98).
; PLAN: r0=241(x), r1=146(y), r2=85(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=111(x), r6=70(y), r7=41(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=73(x1), r11=98(y1), r12=191(x2), r13=98(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 241
LDI r1, 146
LDI r2, 85
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 111
LDI r6, 70
LDI r7, 41
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 73
LDI r11, 98
LDI r12, 191
LDI r13, 98
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
