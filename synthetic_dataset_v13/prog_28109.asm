; DESCRIPTION: Composite: Renders a cyan box of size 37x13 starting at (10, 100) then Renders a orange line between points (177, 161) and (70, 27) then Creates a orange circular shape at (420, 138) with radius 61.
; PLAN: r0=10(x), r1=100(y), r2=37(width), r3=13(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=177(x1), r6=161(y1), r7=70(x2), r8=27(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=420(x), r11=138(y), r12=61(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 10
LDI r1, 100
LDI r2, 37
LDI r3, 13
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 177
LDI r6, 161
LDI r7, 70
LDI r8, 27
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 420
LDI r11, 138
LDI r12, 61
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
