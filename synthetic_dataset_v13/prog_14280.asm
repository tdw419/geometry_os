; DESCRIPTION: Composite: Renders a black disk with center (409, 205) and radius 27 then Draws a green line from (73, 81) to (343, 242) then Draws a black rectangle at (255, 105) with width 34 and height 22.
; PLAN: r0=409(x), r1=205(y), r2=27(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=73(x1), r6=81(y1), r7=343(x2), r8=242(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=255(x), r11=105(y), r12=34(width), r13=22(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 409
LDI r1, 205
LDI r2, 27
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 73
LDI r6, 81
LDI r7, 343
LDI r8, 242
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 255
LDI r11, 105
LDI r12, 34
LDI r13, 22
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
