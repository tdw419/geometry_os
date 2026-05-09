; DESCRIPTION: Composite: Draws a cyan line from (285, 59) to (503, 41) then Places a yellow 34x20 rectangle at position (421, 236) then Draws a green circle centered at (188, 119) with radius 73.
; PLAN: r0=285(x1), r1=59(y1), r2=503(x2), r3=41(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=421(x), r6=236(y), r7=34(width), r8=20(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=188(x), r11=119(y), r12=73(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 285
LDI r1, 59
LDI r2, 503
LDI r3, 41
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 421
LDI r6, 236
LDI r7, 34
LDI r8, 20
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 188
LDI r11, 119
LDI r12, 73
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
