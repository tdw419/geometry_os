; DESCRIPTION: Composite: Places a yellow 30x113 rectangle at position (290, 35) then Renders a green line between points (356, 184) and (386, 131) then Draws a yellow circle centered at (261, 39) with radius 30.
; PLAN: r0=290(x), r1=35(y), r2=30(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=356(x1), r6=184(y1), r7=386(x2), r8=131(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=261(x), r11=39(y), r12=30(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 290
LDI r1, 35
LDI r2, 30
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 356
LDI r6, 184
LDI r7, 386
LDI r8, 131
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 261
LDI r11, 39
LDI r12, 30
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
