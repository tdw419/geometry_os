; DESCRIPTION: Composite: Creates a yellow circular shape at (62, 176) with radius 41 then Places a cyan 21x113 rectangle at position (398, 71) then Renders a yellow line between points (355, 200) and (226, 96).
; PLAN: r0=62(x), r1=176(y), r2=41(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=398(x), r6=71(y), r7=21(width), r8=113(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=355(x1), r11=200(y1), r12=226(x2), r13=96(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 62
LDI r1, 176
LDI r2, 41
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 398
LDI r6, 71
LDI r7, 21
LDI r8, 113
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 355
LDI r11, 200
LDI r12, 226
LDI r13, 96
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
