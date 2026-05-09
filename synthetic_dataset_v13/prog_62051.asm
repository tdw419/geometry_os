; DESCRIPTION: Composite: Places a orange dot at position (367, 169) then Renders a orange box of size 18x107 starting at (387, 58) then Places a cyan line segment connecting (28, 162) to (27, 105).
; PLAN: r0=367(x), r1=169(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=387(x), r6=58(y), r7=18(width), r8=107(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=28(x1), r11=162(y1), r12=27(x2), r13=105(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 367
LDI r1, 169
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 387
LDI r6, 58
LDI r7, 18
LDI r8, 107
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 28
LDI r11, 162
LDI r12, 27
LDI r13, 105
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
