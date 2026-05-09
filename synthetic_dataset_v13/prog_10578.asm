; DESCRIPTION: Composite: Draws a green circle centered at (445, 41) with radius 35 then Places a white 103x55 rectangle at position (381, 129) then Places a magenta line segment connecting (13, 21) to (401, 200).
; PLAN: r0=445(x), r1=41(y), r2=35(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=381(x), r6=129(y), r7=103(width), r8=55(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=13(x1), r11=21(y1), r12=401(x2), r13=200(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 445
LDI r1, 41
LDI r2, 35
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 381
LDI r6, 129
LDI r7, 103
LDI r8, 55
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 13
LDI r11, 21
LDI r12, 401
LDI r13, 200
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
