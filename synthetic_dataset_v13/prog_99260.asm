; DESCRIPTION: Composite: Places a green dot at position (236, 58) then Renders a purple disk with center (244, 101) and radius 29 then Renders a red box of size 93x41 starting at (188, 18).
; PLAN: r0=236(x), r1=58(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=244(x), r6=101(y), r7=29(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=188(x), r11=18(y), r12=93(width), r13=41(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 236
LDI r1, 58
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 244
LDI r6, 101
LDI r7, 29
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 188
LDI r11, 18
LDI r12, 93
LDI r13, 41
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
