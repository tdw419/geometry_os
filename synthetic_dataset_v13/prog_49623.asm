; DESCRIPTION: Composite: Creates a orange circular shape at (59, 63) with radius 46 then Renders a red box of size 47x29 starting at (214, 28) then Renders a red line between points (174, 54) and (250, 37).
; PLAN: r0=59(x), r1=63(y), r2=46(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=214(x), r6=28(y), r7=47(width), r8=29(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=174(x1), r11=54(y1), r12=250(x2), r13=37(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 59
LDI r1, 63
LDI r2, 46
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 214
LDI r6, 28
LDI r7, 47
LDI r8, 29
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 174
LDI r11, 54
LDI r12, 250
LDI r13, 37
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
