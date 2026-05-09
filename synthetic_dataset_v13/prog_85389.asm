; DESCRIPTION: Composite: Creates a yellow circular shape at (275, 66) with radius 57 then Places a purple 51x43 rectangle at position (342, 150) then Places a red line segment connecting (91, 197) to (414, 111).
; PLAN: r0=275(x), r1=66(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=342(x), r6=150(y), r7=51(width), r8=43(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=91(x1), r11=197(y1), r12=414(x2), r13=111(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 275
LDI r1, 66
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 342
LDI r6, 150
LDI r7, 51
LDI r8, 43
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 91
LDI r11, 197
LDI r12, 414
LDI r13, 111
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
