; DESCRIPTION: Composite: Places a magenta 72x34 rectangle at position (347, 18) then Places a cyan circle of radius 46 at center (276, 152) then Renders a white line between points (20, 12) and (433, 67).
; PLAN: r0=347(x), r1=18(y), r2=72(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=276(x), r6=152(y), r7=46(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=20(x1), r11=12(y1), r12=433(x2), r13=67(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 347
LDI r1, 18
LDI r2, 72
LDI r3, 34
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 276
LDI r6, 152
LDI r7, 46
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 20
LDI r11, 12
LDI r12, 433
LDI r13, 67
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
