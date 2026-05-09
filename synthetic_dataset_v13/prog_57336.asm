; DESCRIPTION: Composite: Renders a cyan box of size 40x41 starting at (54, 145) then Places a orange dot at position (184, 124) then Places a purple line segment connecting (154, 118) to (392, 211).
; PLAN: r0=54(x), r1=145(y), r2=40(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=184(x), r6=124(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=154(x1), r11=118(y1), r12=392(x2), r13=211(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 54
LDI r1, 145
LDI r2, 40
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 184
LDI r6, 124
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 154
LDI r11, 118
LDI r12, 392
LDI r13, 211
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
