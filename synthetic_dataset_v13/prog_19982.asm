; DESCRIPTION: Composite: Places a green dot at position (296, 143) then Places a orange 28x34 rectangle at position (243, 17) then Renders a blue disk with center (403, 156) and radius 65.
; PLAN: r0=296(x), r1=143(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=243(x), r6=17(y), r7=28(width), r8=34(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=403(x), r11=156(y), r12=65(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 296
LDI r1, 143
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 243
LDI r6, 17
LDI r7, 28
LDI r8, 34
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 403
LDI r11, 156
LDI r12, 65
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
