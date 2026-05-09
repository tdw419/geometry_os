; DESCRIPTION: Composite: Renders a red line between points (109, 198) and (401, 47) then Places a purple dot at position (504, 134) then Places a magenta 41x29 rectangle at position (287, 181).
; PLAN: r0=109(x1), r1=198(y1), r2=401(x2), r3=47(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=504(x), r6=134(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=287(x), r11=181(y), r12=41(width), r13=29(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 109
LDI r1, 198
LDI r2, 401
LDI r3, 47
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 504
LDI r6, 134
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 287
LDI r11, 181
LDI r12, 41
LDI r13, 29
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
