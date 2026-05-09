; DESCRIPTION: Composite: Draws a cyan rectangle at (33, 126) with width 99 and height 100 then Renders a cyan line between points (24, 161) and (315, 100) then Sets a single white pixel at (492, 182).
; PLAN: r0=33(x), r1=126(y), r2=99(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=24(x1), r6=161(y1), r7=315(x2), r8=100(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=492(x), r11=182(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 33
LDI r1, 126
LDI r2, 99
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 24
LDI r6, 161
LDI r7, 315
LDI r8, 100
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 492
LDI r11, 182
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
