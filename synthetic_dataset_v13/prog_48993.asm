; DESCRIPTION: Composite: Renders a cyan disk with center (445, 122) and radius 37 then Places a yellow 45x117 rectangle at position (284, 123) then Renders a yellow line between points (509, 121) and (241, 85).
; PLAN: r0=445(x), r1=122(y), r2=37(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=284(x), r6=123(y), r7=45(width), r8=117(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=509(x1), r11=121(y1), r12=241(x2), r13=85(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 445
LDI r1, 122
LDI r2, 37
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 284
LDI r6, 123
LDI r7, 45
LDI r8, 117
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 509
LDI r11, 121
LDI r12, 241
LDI r13, 85
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
