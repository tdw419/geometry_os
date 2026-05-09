; DESCRIPTION: Composite: Renders a red disk with center (104, 196) and radius 27 then Places a white line segment connecting (58, 233) to (43, 222) then Places a black 41x44 rectangle at position (160, 7).
; PLAN: r0=104(x), r1=196(y), r2=27(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=58(x1), r6=233(y1), r7=43(x2), r8=222(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=160(x), r11=7(y), r12=41(width), r13=44(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 104
LDI r1, 196
LDI r2, 27
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 58
LDI r6, 233
LDI r7, 43
LDI r8, 222
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 160
LDI r11, 7
LDI r12, 41
LDI r13, 44
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
