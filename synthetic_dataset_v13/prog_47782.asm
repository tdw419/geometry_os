; DESCRIPTION: Composite: Renders a red disk with center (64, 114) and radius 55 then Places a magenta line segment connecting (144, 163) to (115, 216) then Renders a white box of size 14x42 starting at (418, 36).
; PLAN: r0=64(x), r1=114(y), r2=55(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=144(x1), r6=163(y1), r7=115(x2), r8=216(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=418(x), r11=36(y), r12=14(width), r13=42(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 64
LDI r1, 114
LDI r2, 55
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 144
LDI r6, 163
LDI r7, 115
LDI r8, 216
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 418
LDI r11, 36
LDI r12, 14
LDI r13, 42
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
