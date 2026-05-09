; DESCRIPTION: Composite: Renders a cyan line between points (263, 171) and (317, 239) then Draws a blue rectangle at (351, 21) with width 98 and height 36 then Places a black dot at position (55, 17).
; PLAN: r0=263(x1), r1=171(y1), r2=317(x2), r3=239(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=351(x), r6=21(y), r7=98(width), r8=36(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=55(x), r11=17(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 263
LDI r1, 171
LDI r2, 317
LDI r3, 239
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 351
LDI r6, 21
LDI r7, 98
LDI r8, 36
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 55
LDI r11, 17
LDI r12, 0x000000
PSET r10, r11, r12
HALT
