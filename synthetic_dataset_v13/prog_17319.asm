; DESCRIPTION: Composite: Draws a purple rectangle at (297, 22) with width 111 and height 73 then Sets a single magenta pixel at (172, 70) then Renders a green line between points (445, 226) and (456, 114).
; PLAN: r0=297(x), r1=22(y), r2=111(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=172(x), r6=70(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=445(x1), r11=226(y1), r12=456(x2), r13=114(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 297
LDI r1, 22
LDI r2, 111
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 172
LDI r6, 70
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 445
LDI r11, 226
LDI r12, 456
LDI r13, 114
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
