; DESCRIPTION: Composite: Renders a orange disk with center (16, 202) and radius 16 then Places a black 19x40 rectangle at position (221, 168) then Places a yellow line segment connecting (449, 216) to (246, 82).
; PLAN: r0=16(x), r1=202(y), r2=16(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=221(x), r6=168(y), r7=19(width), r8=40(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=449(x1), r11=216(y1), r12=246(x2), r13=82(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 16
LDI r1, 202
LDI r2, 16
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 221
LDI r6, 168
LDI r7, 19
LDI r8, 40
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 449
LDI r11, 216
LDI r12, 246
LDI r13, 82
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
