; DESCRIPTION: Composite: Renders a blue line between points (439, 16) and (290, 102) then Sets a single green pixel at (352, 99) then Draws a yellow rectangle at (360, 46) with width 67 and height 59.
; PLAN: r0=439(x1), r1=16(y1), r2=290(x2), r3=102(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=352(x), r6=99(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=360(x), r11=46(y), r12=67(width), r13=59(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 439
LDI r1, 16
LDI r2, 290
LDI r3, 102
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 352
LDI r6, 99
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 360
LDI r11, 46
LDI r12, 67
LDI r13, 59
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
