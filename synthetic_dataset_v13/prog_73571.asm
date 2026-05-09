; DESCRIPTION: Composite: Draws a purple circle centered at (243, 165) with radius 76 then Renders a black box of size 81x32 starting at (20, 40) then Draws a white line from (180, 108) to (29, 73).
; PLAN: r0=243(x), r1=165(y), r2=76(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=20(x), r6=40(y), r7=81(width), r8=32(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=180(x1), r11=108(y1), r12=29(x2), r13=73(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 243
LDI r1, 165
LDI r2, 76
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 20
LDI r6, 40
LDI r7, 81
LDI r8, 32
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 180
LDI r11, 108
LDI r12, 29
LDI r13, 73
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
