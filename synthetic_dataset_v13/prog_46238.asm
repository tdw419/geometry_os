; DESCRIPTION: Composite: Draws a cyan rectangle at (80, 98) with width 69 and height 43 then Places a white dot at position (86, 36) then Draws a black line from (392, 165) to (475, 60).
; PLAN: r0=80(x), r1=98(y), r2=69(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=86(x), r6=36(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=392(x1), r11=165(y1), r12=475(x2), r13=60(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 80
LDI r1, 98
LDI r2, 69
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 86
LDI r6, 36
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 392
LDI r11, 165
LDI r12, 475
LDI r13, 60
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
