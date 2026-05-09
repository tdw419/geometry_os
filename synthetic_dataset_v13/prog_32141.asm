; DESCRIPTION: Composite: Places a green dot at position (315, 220) then Draws a green rectangle at (141, 117) with width 64 and height 42 then Places a purple circle of radius 18 at center (413, 144).
; PLAN: r0=315(x), r1=220(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=141(x), r6=117(y), r7=64(width), r8=42(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=413(x), r11=144(y), r12=18(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 315
LDI r1, 220
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 141
LDI r6, 117
LDI r7, 64
LDI r8, 42
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 413
LDI r11, 144
LDI r12, 18
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
