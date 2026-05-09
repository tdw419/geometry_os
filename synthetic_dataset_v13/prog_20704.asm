; DESCRIPTION: Composite: Renders a cyan line between points (166, 79) and (5, 232) then Places a green circle of radius 70 at center (274, 108) then Renders a white box of size 113x73 starting at (363, 166).
; PLAN: r0=166(x1), r1=79(y1), r2=5(x2), r3=232(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=274(x), r6=108(y), r7=70(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=363(x), r11=166(y), r12=113(width), r13=73(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 166
LDI r1, 79
LDI r2, 5
LDI r3, 232
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 274
LDI r6, 108
LDI r7, 70
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 363
LDI r11, 166
LDI r12, 113
LDI r13, 73
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
