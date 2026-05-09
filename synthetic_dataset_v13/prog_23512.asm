; DESCRIPTION: Composite: Draws a black line from (112, 214) to (242, 74) then Draws a orange rectangle at (398, 61) with width 72 and height 106 then Draws a yellow circle centered at (262, 83) with radius 59.
; PLAN: r0=112(x1), r1=214(y1), r2=242(x2), r3=74(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=398(x), r6=61(y), r7=72(width), r8=106(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=262(x), r11=83(y), r12=59(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 112
LDI r1, 214
LDI r2, 242
LDI r3, 74
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 398
LDI r6, 61
LDI r7, 72
LDI r8, 106
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 262
LDI r11, 83
LDI r12, 59
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
