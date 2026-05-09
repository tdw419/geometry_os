; DESCRIPTION: Composite: Creates a white circular shape at (403, 164) with radius 55 then Renders a blue line between points (219, 231) and (289, 246) then Places a white 11x90 rectangle at position (428, 74).
; PLAN: r0=403(x), r1=164(y), r2=55(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=219(x1), r6=231(y1), r7=289(x2), r8=246(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=428(x), r11=74(y), r12=11(width), r13=90(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 403
LDI r1, 164
LDI r2, 55
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 219
LDI r6, 231
LDI r7, 289
LDI r8, 246
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 428
LDI r11, 74
LDI r12, 11
LDI r13, 90
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
