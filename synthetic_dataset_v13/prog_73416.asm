; DESCRIPTION: Composite: Sets a single orange pixel at (189, 199) then Draws a white line from (10, 100) to (85, 242) then Draws a yellow rectangle at (135, 30) with width 91 and height 59.
; PLAN: r0=189(x), r1=199(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=10(x1), r6=100(y1), r7=85(x2), r8=242(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=135(x), r11=30(y), r12=91(width), r13=59(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 189
LDI r1, 199
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 10
LDI r6, 100
LDI r7, 85
LDI r8, 242
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 135
LDI r11, 30
LDI r12, 91
LDI r13, 59
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
