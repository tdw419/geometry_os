; DESCRIPTION: Composite: Draws a black rectangle at (281, 107) with width 24 and height 64 then Draws a black line from (175, 100) to (125, 215) then Places a blue dot at position (88, 159).
; PLAN: r0=281(x), r1=107(y), r2=24(width), r3=64(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=175(x1), r6=100(y1), r7=125(x2), r8=215(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=88(x), r11=159(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 281
LDI r1, 107
LDI r2, 24
LDI r3, 64
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 175
LDI r6, 100
LDI r7, 125
LDI r8, 215
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 88
LDI r11, 159
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
