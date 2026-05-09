; DESCRIPTION: Composite: Places a orange circle of radius 71 at center (234, 140) then Draws a cyan rectangle at (443, 16) with width 45 and height 111 then Renders a white line between points (192, 50) and (279, 47).
; PLAN: r0=234(x), r1=140(y), r2=71(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=443(x), r6=16(y), r7=45(width), r8=111(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=192(x1), r11=50(y1), r12=279(x2), r13=47(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 234
LDI r1, 140
LDI r2, 71
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 443
LDI r6, 16
LDI r7, 45
LDI r8, 111
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 192
LDI r11, 50
LDI r12, 279
LDI r13, 47
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
