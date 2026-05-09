; DESCRIPTION: Composite: Draws a purple rectangle at (124, 174) with width 115 and height 29 then Renders a black line between points (193, 8) and (255, 184).
; PLAN: r0=124(x), r1=174(y), r2=115(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=193(x1), r6=8(y1), r7=255(x2), r8=184(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 124
LDI r1, 174
LDI r2, 115
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 193
LDI r6, 8
LDI r7, 255
LDI r8, 184
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
