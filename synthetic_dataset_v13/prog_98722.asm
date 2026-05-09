; DESCRIPTION: Composite: Creates a yellow circular shape at (292, 84) with radius 76 then Places a yellow line segment connecting (90, 239) to (313, 205) then Renders a purple box of size 61x114 starting at (287, 70).
; PLAN: r0=292(x), r1=84(y), r2=76(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=90(x1), r6=239(y1), r7=313(x2), r8=205(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=287(x), r11=70(y), r12=61(width), r13=114(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 292
LDI r1, 84
LDI r2, 76
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 90
LDI r6, 239
LDI r7, 313
LDI r8, 205
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 287
LDI r11, 70
LDI r12, 61
LDI r13, 114
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
