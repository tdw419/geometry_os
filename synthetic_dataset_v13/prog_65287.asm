; DESCRIPTION: Composite: Renders a orange line between points (152, 10) and (345, 4) then Sets a single black pixel at (160, 41) then Creates a cyan rectangular region at (213, 6) spanning 50 by 30 pixels.
; PLAN: r0=152(x1), r1=10(y1), r2=345(x2), r3=4(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=160(x), r6=41(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=213(x), r11=6(y), r12=50(width), r13=30(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 152
LDI r1, 10
LDI r2, 345
LDI r3, 4
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 160
LDI r6, 41
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 213
LDI r11, 6
LDI r12, 50
LDI r13, 30
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
