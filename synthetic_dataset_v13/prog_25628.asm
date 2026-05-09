; DESCRIPTION: Composite: Places a orange line segment connecting (266, 210) to (300, 155) then Renders a magenta box of size 74x110 starting at (90, 32) then Renders a cyan disk with center (108, 189) and radius 67.
; PLAN: r0=266(x1), r1=210(y1), r2=300(x2), r3=155(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=90(x), r6=32(y), r7=74(width), r8=110(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=108(x), r11=189(y), r12=67(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 266
LDI r1, 210
LDI r2, 300
LDI r3, 155
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 90
LDI r6, 32
LDI r7, 74
LDI r8, 110
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 108
LDI r11, 189
LDI r12, 67
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
