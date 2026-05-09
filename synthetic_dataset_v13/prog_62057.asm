; DESCRIPTION: Composite: Renders a cyan line between points (395, 31) and (280, 136) then Places a blue dot at position (207, 28) then Draws a cyan rectangle at (88, 82) with width 39 and height 32.
; PLAN: r0=395(x1), r1=31(y1), r2=280(x2), r3=136(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=207(x), r6=28(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=88(x), r11=82(y), r12=39(width), r13=32(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 395
LDI r1, 31
LDI r2, 280
LDI r3, 136
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 207
LDI r6, 28
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 88
LDI r11, 82
LDI r12, 39
LDI r13, 32
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
