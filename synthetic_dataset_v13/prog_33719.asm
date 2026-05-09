; DESCRIPTION: Composite: Draws a white rectangle at (320, 17) with width 22 and height 46 then Places a orange dot at position (339, 161) then Renders a magenta line between points (168, 161) and (200, 186).
; PLAN: r0=320(x), r1=17(y), r2=22(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=339(x), r6=161(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=168(x1), r11=161(y1), r12=200(x2), r13=186(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 320
LDI r1, 17
LDI r2, 22
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 339
LDI r6, 161
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 168
LDI r11, 161
LDI r12, 200
LDI r13, 186
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
