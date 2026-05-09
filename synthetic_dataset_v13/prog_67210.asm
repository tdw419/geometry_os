; DESCRIPTION: Composite: Draws a red circle centered at (311, 202) with radius 13 then Renders a green line between points (271, 10) and (193, 107) then Places a purple 97x61 rectangle at position (223, 109).
; PLAN: r0=311(x), r1=202(y), r2=13(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=271(x1), r6=10(y1), r7=193(x2), r8=107(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=223(x), r11=109(y), r12=97(width), r13=61(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 311
LDI r1, 202
LDI r2, 13
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 271
LDI r6, 10
LDI r7, 193
LDI r8, 107
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 223
LDI r11, 109
LDI r12, 97
LDI r13, 61
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
