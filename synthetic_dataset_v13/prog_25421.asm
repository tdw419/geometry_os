; DESCRIPTION: Composite: Draws a black line from (67, 56) to (277, 55) then Draws a yellow circle centered at (305, 135) with radius 73 then Places a white 31x82 rectangle at position (433, 66).
; PLAN: r0=67(x1), r1=56(y1), r2=277(x2), r3=55(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=305(x), r6=135(y), r7=73(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=433(x), r11=66(y), r12=31(width), r13=82(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 67
LDI r1, 56
LDI r2, 277
LDI r3, 55
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 305
LDI r6, 135
LDI r7, 73
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 433
LDI r11, 66
LDI r12, 31
LDI r13, 82
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
