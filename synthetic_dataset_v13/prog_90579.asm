; DESCRIPTION: Composite: Sets a single cyan pixel at (222, 1) then Places a orange line segment connecting (139, 30) to (106, 40) then Renders a cyan box of size 27x55 starting at (63, 101).
; PLAN: r0=222(x), r1=1(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=139(x1), r6=30(y1), r7=106(x2), r8=40(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=63(x), r11=101(y), r12=27(width), r13=55(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 222
LDI r1, 1
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 139
LDI r6, 30
LDI r7, 106
LDI r8, 40
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 63
LDI r11, 101
LDI r12, 27
LDI r13, 55
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
