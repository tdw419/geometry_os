; DESCRIPTION: Composite: Draws a red circle centered at (110, 116) with radius 37 then Draws a cyan line from (422, 23) to (419, 184) then Draws a white rectangle at (416, 31) with width 49 and height 54.
; PLAN: r0=110(x), r1=116(y), r2=37(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=422(x1), r6=23(y1), r7=419(x2), r8=184(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=416(x), r11=31(y), r12=49(width), r13=54(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 110
LDI r1, 116
LDI r2, 37
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 422
LDI r6, 23
LDI r7, 419
LDI r8, 184
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 416
LDI r11, 31
LDI r12, 49
LDI r13, 54
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
