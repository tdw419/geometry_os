; DESCRIPTION: Composite: Renders a white disk with center (115, 186) and radius 34 then Places a yellow 60x58 rectangle at position (98, 191) then Renders a yellow line between points (201, 122) and (397, 241).
; PLAN: r0=115(x), r1=186(y), r2=34(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=98(x), r6=191(y), r7=60(width), r8=58(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=201(x1), r11=122(y1), r12=397(x2), r13=241(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 115
LDI r1, 186
LDI r2, 34
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 98
LDI r6, 191
LDI r7, 60
LDI r8, 58
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 201
LDI r11, 122
LDI r12, 397
LDI r13, 241
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
