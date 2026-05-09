; DESCRIPTION: Composite: Places a blue dot at position (112, 238) then Places a magenta 70x41 rectangle at position (99, 84) then Renders a white line between points (280, 164) and (359, 225).
; PLAN: r0=112(x), r1=238(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=99(x), r6=84(y), r7=70(width), r8=41(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=280(x1), r11=164(y1), r12=359(x2), r13=225(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 112
LDI r1, 238
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 99
LDI r6, 84
LDI r7, 70
LDI r8, 41
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 280
LDI r11, 164
LDI r12, 359
LDI r13, 225
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
