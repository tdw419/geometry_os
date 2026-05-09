; DESCRIPTION: Composite: Draws a yellow line from (74, 23) to (68, 223) then Places a magenta 92x20 rectangle at position (131, 77) then Draws a cyan circle centered at (88, 53) with radius 38.
; PLAN: r0=74(x1), r1=23(y1), r2=68(x2), r3=223(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=131(x), r6=77(y), r7=92(width), r8=20(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=88(x), r11=53(y), r12=38(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 74
LDI r1, 23
LDI r2, 68
LDI r3, 223
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 131
LDI r6, 77
LDI r7, 92
LDI r8, 20
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 88
LDI r11, 53
LDI r12, 38
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
