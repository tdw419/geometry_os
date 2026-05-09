; DESCRIPTION: Composite: Creates a white circular shape at (375, 135) with radius 45 then Renders a orange box of size 59x120 starting at (234, 129) then Draws a red line from (22, 145) to (303, 73).
; PLAN: r0=375(x), r1=135(y), r2=45(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=234(x), r6=129(y), r7=59(width), r8=120(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=22(x1), r11=145(y1), r12=303(x2), r13=73(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 375
LDI r1, 135
LDI r2, 45
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 234
LDI r6, 129
LDI r7, 59
LDI r8, 120
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 22
LDI r11, 145
LDI r12, 303
LDI r13, 73
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
