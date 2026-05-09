; DESCRIPTION: Composite: Draws a blue line from (215, 240) to (326, 95) then Draws a yellow circle centered at (171, 114) with radius 74 then Places a red 95x13 rectangle at position (313, 78).
; PLAN: r0=215(x1), r1=240(y1), r2=326(x2), r3=95(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=171(x), r6=114(y), r7=74(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=313(x), r11=78(y), r12=95(width), r13=13(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 215
LDI r1, 240
LDI r2, 326
LDI r3, 95
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 171
LDI r6, 114
LDI r7, 74
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 313
LDI r11, 78
LDI r12, 95
LDI r13, 13
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
