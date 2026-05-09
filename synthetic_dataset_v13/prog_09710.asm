; DESCRIPTION: Composite: Places a black circle of radius 71 at center (101, 122) then Places a orange 56x107 rectangle at position (228, 45) then Renders a cyan line between points (316, 147) and (91, 86).
; PLAN: r0=101(x), r1=122(y), r2=71(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=228(x), r6=45(y), r7=56(width), r8=107(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=316(x1), r11=147(y1), r12=91(x2), r13=86(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 101
LDI r1, 122
LDI r2, 71
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 228
LDI r6, 45
LDI r7, 56
LDI r8, 107
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 316
LDI r11, 147
LDI r12, 91
LDI r13, 86
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
