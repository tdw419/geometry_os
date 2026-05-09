; DESCRIPTION: Composite: Renders a purple disk with center (406, 123) and radius 53 then Places a purple 59x18 rectangle at position (336, 236) then Places a purple line segment connecting (177, 239) to (166, 32).
; PLAN: r0=406(x), r1=123(y), r2=53(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=336(x), r6=236(y), r7=59(width), r8=18(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=177(x1), r11=239(y1), r12=166(x2), r13=32(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 406
LDI r1, 123
LDI r2, 53
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 336
LDI r6, 236
LDI r7, 59
LDI r8, 18
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 177
LDI r11, 239
LDI r12, 166
LDI r13, 32
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
