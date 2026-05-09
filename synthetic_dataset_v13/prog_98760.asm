; DESCRIPTION: Composite: Places a blue dot at position (239, 110) then Renders a red line between points (322, 169) and (157, 65) then Renders a orange box of size 22x109 starting at (409, 18).
; PLAN: r0=239(x), r1=110(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=322(x1), r6=169(y1), r7=157(x2), r8=65(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=409(x), r11=18(y), r12=22(width), r13=109(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 239
LDI r1, 110
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 322
LDI r6, 169
LDI r7, 157
LDI r8, 65
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 409
LDI r11, 18
LDI r12, 22
LDI r13, 109
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
