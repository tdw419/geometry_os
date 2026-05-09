; DESCRIPTION: Composite: Creates a yellow circular shape at (362, 189) with radius 24 then Places a purple line segment connecting (5, 248) to (336, 176) then Places a cyan 51x25 rectangle at position (360, 11).
; PLAN: r0=362(x), r1=189(y), r2=24(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=5(x1), r6=248(y1), r7=336(x2), r8=176(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=360(x), r11=11(y), r12=51(width), r13=25(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 362
LDI r1, 189
LDI r2, 24
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 5
LDI r6, 248
LDI r7, 336
LDI r8, 176
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 360
LDI r11, 11
LDI r12, 51
LDI r13, 25
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
