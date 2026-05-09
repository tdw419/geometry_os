; DESCRIPTION: Composite: Renders a green line between points (262, 52) and (76, 55) then Renders a orange box of size 14x117 starting at (298, 45) then Draws a yellow circle centered at (193, 202) with radius 16.
; PLAN: r0=262(x1), r1=52(y1), r2=76(x2), r3=55(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=298(x), r6=45(y), r7=14(width), r8=117(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=193(x), r11=202(y), r12=16(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 262
LDI r1, 52
LDI r2, 76
LDI r3, 55
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 298
LDI r6, 45
LDI r7, 14
LDI r8, 117
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 193
LDI r11, 202
LDI r12, 16
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
