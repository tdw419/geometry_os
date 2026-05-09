; DESCRIPTION: Composite: Creates a blue circular shape at (421, 94) with radius 51 then Renders a purple line between points (443, 89) and (197, 20) then Places a yellow 46x102 rectangle at position (271, 20).
; PLAN: r0=421(x), r1=94(y), r2=51(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=443(x1), r6=89(y1), r7=197(x2), r8=20(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=271(x), r11=20(y), r12=46(width), r13=102(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 421
LDI r1, 94
LDI r2, 51
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 443
LDI r6, 89
LDI r7, 197
LDI r8, 20
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 271
LDI r11, 20
LDI r12, 46
LDI r13, 102
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
