; DESCRIPTION: Composite: Renders a yellow box of size 46x90 starting at (277, 83) then Places a white line segment connecting (260, 134) to (279, 49) then Places a magenta circle of radius 19 at center (244, 117).
; PLAN: r0=277(x), r1=83(y), r2=46(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=260(x1), r6=134(y1), r7=279(x2), r8=49(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=244(x), r11=117(y), r12=19(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 277
LDI r1, 83
LDI r2, 46
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 260
LDI r6, 134
LDI r7, 279
LDI r8, 49
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 244
LDI r11, 117
LDI r12, 19
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
