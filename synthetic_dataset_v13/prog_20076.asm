; DESCRIPTION: Composite: Places a orange 83x38 rectangle at position (287, 20) then Renders a white disk with center (420, 128) and radius 68 then Renders a black line between points (488, 221) and (378, 174).
; PLAN: r0=287(x), r1=20(y), r2=83(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=420(x), r6=128(y), r7=68(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=488(x1), r11=221(y1), r12=378(x2), r13=174(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 287
LDI r1, 20
LDI r2, 83
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 420
LDI r6, 128
LDI r7, 68
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 488
LDI r11, 221
LDI r12, 378
LDI r13, 174
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
