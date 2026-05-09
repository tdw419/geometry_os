; DESCRIPTION: Composite: Renders a white box of size 113x98 starting at (107, 126) then Places a purple dot at position (241, 196) then Draws a black line from (372, 176) to (230, 126).
; PLAN: r0=107(x), r1=126(y), r2=113(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=241(x), r6=196(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=372(x1), r11=176(y1), r12=230(x2), r13=126(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 107
LDI r1, 126
LDI r2, 113
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 241
LDI r6, 196
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 372
LDI r11, 176
LDI r12, 230
LDI r13, 126
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
