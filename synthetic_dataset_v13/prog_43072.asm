; DESCRIPTION: Composite: Places a yellow dot at position (184, 64) then Draws a cyan rectangle at (158, 136) with width 55 and height 59 then Draws a green line from (11, 149) to (450, 162).
; PLAN: r0=184(x), r1=64(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=158(x), r6=136(y), r7=55(width), r8=59(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=11(x1), r11=149(y1), r12=450(x2), r13=162(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 184
LDI r1, 64
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 158
LDI r6, 136
LDI r7, 55
LDI r8, 59
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 11
LDI r11, 149
LDI r12, 450
LDI r13, 162
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
