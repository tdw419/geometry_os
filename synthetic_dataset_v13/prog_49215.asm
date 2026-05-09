; DESCRIPTION: Composite: Places a red 117x18 rectangle at position (262, 130) then Places a red dot at position (113, 189) then Renders a black line between points (67, 119) and (400, 152).
; PLAN: r0=262(x), r1=130(y), r2=117(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=113(x), r6=189(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=67(x1), r11=119(y1), r12=400(x2), r13=152(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 262
LDI r1, 130
LDI r2, 117
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 113
LDI r6, 189
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 67
LDI r11, 119
LDI r12, 400
LDI r13, 152
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
