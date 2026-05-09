; DESCRIPTION: Composite: Creates a black circular shape at (75, 126) with radius 31 then Places a purple 59x12 rectangle at position (298, 231) then Places a white line segment connecting (82, 124) to (416, 25).
; PLAN: r0=75(x), r1=126(y), r2=31(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=298(x), r6=231(y), r7=59(width), r8=12(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=82(x1), r11=124(y1), r12=416(x2), r13=25(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 75
LDI r1, 126
LDI r2, 31
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 298
LDI r6, 231
LDI r7, 59
LDI r8, 12
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 82
LDI r11, 124
LDI r12, 416
LDI r13, 25
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
