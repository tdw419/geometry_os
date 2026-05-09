; DESCRIPTION: Composite: Renders a black disk with center (207, 159) and radius 57 then Renders a red line between points (433, 21) and (117, 238) then Renders a yellow box of size 113x78 starting at (7, 161).
; PLAN: r0=207(x), r1=159(y), r2=57(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=433(x1), r6=21(y1), r7=117(x2), r8=238(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=7(x), r11=161(y), r12=113(width), r13=78(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 207
LDI r1, 159
LDI r2, 57
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 433
LDI r6, 21
LDI r7, 117
LDI r8, 238
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 7
LDI r11, 161
LDI r12, 113
LDI r13, 78
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
