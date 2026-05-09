; DESCRIPTION: Composite: Draws a blue circle centered at (411, 38) with radius 32 then Places a cyan 53x92 rectangle at position (176, 4) then Draws a cyan line from (191, 9) to (435, 238).
; PLAN: r0=411(x), r1=38(y), r2=32(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=176(x), r6=4(y), r7=53(width), r8=92(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=191(x1), r11=9(y1), r12=435(x2), r13=238(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 411
LDI r1, 38
LDI r2, 32
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 176
LDI r6, 4
LDI r7, 53
LDI r8, 92
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 191
LDI r11, 9
LDI r12, 435
LDI r13, 238
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
