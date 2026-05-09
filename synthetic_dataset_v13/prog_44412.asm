; DESCRIPTION: Composite: Creates a red circular shape at (304, 195) with radius 52 then Renders a blue line between points (112, 208) and (231, 232) then Places a white 37x93 rectangle at position (176, 19).
; PLAN: r0=304(x), r1=195(y), r2=52(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=112(x1), r6=208(y1), r7=231(x2), r8=232(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=176(x), r11=19(y), r12=37(width), r13=93(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 304
LDI r1, 195
LDI r2, 52
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 112
LDI r6, 208
LDI r7, 231
LDI r8, 232
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 176
LDI r11, 19
LDI r12, 37
LDI r13, 93
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
