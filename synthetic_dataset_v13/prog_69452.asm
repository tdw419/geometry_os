; DESCRIPTION: Composite: Renders a black disk with center (62, 60) and radius 56 then Places a blue line segment connecting (307, 19) to (141, 147) then Places a cyan 55x70 rectangle at position (263, 95).
; PLAN: r0=62(x), r1=60(y), r2=56(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=307(x1), r6=19(y1), r7=141(x2), r8=147(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=263(x), r11=95(y), r12=55(width), r13=70(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 62
LDI r1, 60
LDI r2, 56
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 307
LDI r6, 19
LDI r7, 141
LDI r8, 147
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 263
LDI r11, 95
LDI r12, 55
LDI r13, 70
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
