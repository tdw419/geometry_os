; DESCRIPTION: Composite: Renders a black disk with center (259, 55) and radius 43 then Places a cyan 92x67 rectangle at position (245, 130) then Draws a purple line from (34, 43) to (333, 254).
; PLAN: r0=259(x), r1=55(y), r2=43(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=245(x), r6=130(y), r7=92(width), r8=67(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=34(x1), r11=43(y1), r12=333(x2), r13=254(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 259
LDI r1, 55
LDI r2, 43
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 245
LDI r6, 130
LDI r7, 92
LDI r8, 67
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 34
LDI r11, 43
LDI r12, 333
LDI r13, 254
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
