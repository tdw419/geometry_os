; DESCRIPTION: Composite: Places a yellow dot at position (288, 29) then Places a white 76x91 rectangle at position (28, 79) then Places a red line segment connecting (393, 238) to (109, 162).
; PLAN: r0=288(x), r1=29(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=28(x), r6=79(y), r7=76(width), r8=91(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=393(x1), r11=238(y1), r12=109(x2), r13=162(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 288
LDI r1, 29
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 28
LDI r6, 79
LDI r7, 76
LDI r8, 91
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 393
LDI r11, 238
LDI r12, 109
LDI r13, 162
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
