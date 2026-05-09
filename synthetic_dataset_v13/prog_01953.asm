; DESCRIPTION: Composite: Renders a white line between points (329, 200) and (112, 192) then Renders a orange box of size 45x12 starting at (100, 135) then Places a black dot at position (11, 209).
; PLAN: r0=329(x1), r1=200(y1), r2=112(x2), r3=192(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=100(x), r6=135(y), r7=45(width), r8=12(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=11(x), r11=209(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 329
LDI r1, 200
LDI r2, 112
LDI r3, 192
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 100
LDI r6, 135
LDI r7, 45
LDI r8, 12
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 11
LDI r11, 209
LDI r12, 0x000000
PSET r10, r11, r12
HALT
