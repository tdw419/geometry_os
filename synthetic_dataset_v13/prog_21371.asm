; DESCRIPTION: Composite: Creates a yellow circular shape at (51, 164) with radius 39 then Draws a yellow line from (446, 34) to (139, 50) then Creates a blue rectangular region at (235, 197) spanning 25 by 42 pixels.
; PLAN: r0=51(x), r1=164(y), r2=39(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=446(x1), r6=34(y1), r7=139(x2), r8=50(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=235(x), r11=197(y), r12=25(width), r13=42(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 51
LDI r1, 164
LDI r2, 39
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 446
LDI r6, 34
LDI r7, 139
LDI r8, 50
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 235
LDI r11, 197
LDI r12, 25
LDI r13, 42
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
