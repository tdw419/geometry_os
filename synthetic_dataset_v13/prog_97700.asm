; DESCRIPTION: Composite: Places a magenta dot at position (198, 125) then Draws a black rectangle at (311, 180) with width 72 and height 69 then Places a black line segment connecting (19, 69) to (446, 54).
; PLAN: r0=198(x), r1=125(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=311(x), r6=180(y), r7=72(width), r8=69(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=19(x1), r11=69(y1), r12=446(x2), r13=54(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 198
LDI r1, 125
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 311
LDI r6, 180
LDI r7, 72
LDI r8, 69
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 19
LDI r11, 69
LDI r12, 446
LDI r13, 54
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
