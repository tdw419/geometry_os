; DESCRIPTION: Composite: Renders a white box of size 24x57 starting at (117, 192) then Places a cyan line segment connecting (177, 123) to (385, 80) then Draws a white circle centered at (289, 213) with radius 27.
; PLAN: r0=117(x), r1=192(y), r2=24(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=177(x1), r6=123(y1), r7=385(x2), r8=80(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=289(x), r11=213(y), r12=27(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 117
LDI r1, 192
LDI r2, 24
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 177
LDI r6, 123
LDI r7, 385
LDI r8, 80
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 289
LDI r11, 213
LDI r12, 27
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
