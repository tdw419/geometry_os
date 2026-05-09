; DESCRIPTION: Composite: Places a red circle of radius 56 at center (324, 81) then Draws a green line from (433, 177) to (338, 164) then Draws a purple rectangle at (274, 134) with width 39 and height 48.
; PLAN: r0=324(x), r1=81(y), r2=56(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=433(x1), r6=177(y1), r7=338(x2), r8=164(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=274(x), r11=134(y), r12=39(width), r13=48(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 324
LDI r1, 81
LDI r2, 56
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 433
LDI r6, 177
LDI r7, 338
LDI r8, 164
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 274
LDI r11, 134
LDI r12, 39
LDI r13, 48
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
