; DESCRIPTION: Composite: Draws a red rectangle at (95, 125) with width 52 and height 48 then Places a orange line segment connecting (409, 234) to (243, 55) then Places a green dot at position (182, 227).
; PLAN: r0=95(x), r1=125(y), r2=52(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=409(x1), r6=234(y1), r7=243(x2), r8=55(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=182(x), r11=227(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 95
LDI r1, 125
LDI r2, 52
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 409
LDI r6, 234
LDI r7, 243
LDI r8, 55
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 182
LDI r11, 227
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
