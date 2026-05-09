; DESCRIPTION: Composite: Draws a cyan line from (329, 182) to (258, 135) then Draws a black rectangle at (216, 14) with width 35 and height 46 then Draws a white circle centered at (372, 205) with radius 31.
; PLAN: r0=329(x1), r1=182(y1), r2=258(x2), r3=135(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=216(x), r6=14(y), r7=35(width), r8=46(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=372(x), r11=205(y), r12=31(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 329
LDI r1, 182
LDI r2, 258
LDI r3, 135
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 216
LDI r6, 14
LDI r7, 35
LDI r8, 46
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 372
LDI r11, 205
LDI r12, 31
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
