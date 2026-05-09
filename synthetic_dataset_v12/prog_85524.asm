; DESCRIPTION: Composite: Renders a black line between points (227, 117) and (278, 134) then Places a blue 43x53 rectangle at position (207, 48) then Places a black dot at position (74, 227).
; PLAN: r0=227(x1), r1=117(y1), r2=278(x2), r3=134(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=207(x), r6=48(y), r7=43(width), r8=53(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=74(x), r11=227(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 227
LDI r1, 117
LDI r2, 278
LDI r3, 134
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 207
LDI r6, 48
LDI r7, 43
LDI r8, 53
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 74
LDI r11, 227
LDI r12, 0x000000
PSET r10, r11, r12
HALT
