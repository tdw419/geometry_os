; DESCRIPTION: Composite: Renders a red box of size 91x28 starting at (3, 136) then Places a yellow line segment connecting (114, 76) to (127, 46).
; PLAN: r0=3(x), r1=136(y), r2=91(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=114(x1), r6=76(y1), r7=127(x2), r8=46(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 3
LDI r1, 136
LDI r2, 91
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 114
LDI r6, 76
LDI r7, 127
LDI r8, 46
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
