; DESCRIPTION: Composite: Sets a single blue pixel at (394, 173) then Places a green line segment connecting (324, 218) to (443, 151) then Draws a green rectangle at (187, 46) with width 24 and height 34.
; PLAN: r0=394(x), r1=173(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=324(x1), r6=218(y1), r7=443(x2), r8=151(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=187(x), r11=46(y), r12=24(width), r13=34(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 394
LDI r1, 173
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 324
LDI r6, 218
LDI r7, 443
LDI r8, 151
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 187
LDI r11, 46
LDI r12, 24
LDI r13, 34
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
