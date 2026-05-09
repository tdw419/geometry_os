; DESCRIPTION: Composite: Draws a black line from (139, 206) to (356, 161) then Draws a blue rectangle at (183, 141) with width 58 and height 37 then Places a blue dot at position (103, 36).
; PLAN: r0=139(x1), r1=206(y1), r2=356(x2), r3=161(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=183(x), r6=141(y), r7=58(width), r8=37(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=103(x), r11=36(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 139
LDI r1, 206
LDI r2, 356
LDI r3, 161
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 183
LDI r6, 141
LDI r7, 58
LDI r8, 37
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 103
LDI r11, 36
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
