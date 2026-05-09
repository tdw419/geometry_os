; DESCRIPTION: Composite: Renders a blue line between points (274, 46) and (297, 27) then Places a white 86x11 rectangle at position (55, 217) then Places a green dot at position (261, 206).
; PLAN: r0=274(x1), r1=46(y1), r2=297(x2), r3=27(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=55(x), r6=217(y), r7=86(width), r8=11(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=261(x), r11=206(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 274
LDI r1, 46
LDI r2, 297
LDI r3, 27
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 55
LDI r6, 217
LDI r7, 86
LDI r8, 11
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 261
LDI r11, 206
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
