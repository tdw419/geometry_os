; DESCRIPTION: Composite: Creates a white circular shape at (184, 124) with radius 45 then Renders a yellow box of size 97x120 starting at (6, 45) then Places a cyan line segment connecting (117, 142) to (46, 206).
; PLAN: r0=184(x), r1=124(y), r2=45(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=6(x), r6=45(y), r7=97(width), r8=120(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=117(x1), r11=142(y1), r12=46(x2), r13=206(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 184
LDI r1, 124
LDI r2, 45
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 6
LDI r6, 45
LDI r7, 97
LDI r8, 120
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 117
LDI r11, 142
LDI r12, 46
LDI r13, 206
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
