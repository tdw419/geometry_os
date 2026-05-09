; DESCRIPTION: Composite: Creates a magenta circular shape at (319, 82) with radius 41 then Places a purple 78x50 rectangle at position (424, 101) then Draws a white line from (168, 249) to (230, 68).
; PLAN: r0=319(x), r1=82(y), r2=41(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=424(x), r6=101(y), r7=78(width), r8=50(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=168(x1), r11=249(y1), r12=230(x2), r13=68(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 319
LDI r1, 82
LDI r2, 41
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 424
LDI r6, 101
LDI r7, 78
LDI r8, 50
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 168
LDI r11, 249
LDI r12, 230
LDI r13, 68
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
