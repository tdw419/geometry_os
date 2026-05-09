; DESCRIPTION: Composite: Renders a yellow line between points (311, 67) and (209, 97) then Renders a cyan disk with center (82, 178) and radius 62 then Renders a purple box of size 78x116 starting at (82, 121).
; PLAN: r0=311(x1), r1=67(y1), r2=209(x2), r3=97(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=82(x), r6=178(y), r7=62(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=82(x), r11=121(y), r12=78(width), r13=116(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 311
LDI r1, 67
LDI r2, 209
LDI r3, 97
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 82
LDI r6, 178
LDI r7, 62
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 82
LDI r11, 121
LDI r12, 78
LDI r13, 116
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
