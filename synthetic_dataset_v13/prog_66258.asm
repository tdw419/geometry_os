; DESCRIPTION: Composite: Creates a yellow circular shape at (354, 214) with radius 24 then Draws a green line from (190, 232) to (307, 214) then Places a white 97x58 rectangle at position (293, 96).
; PLAN: r0=354(x), r1=214(y), r2=24(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=190(x1), r6=232(y1), r7=307(x2), r8=214(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=293(x), r11=96(y), r12=97(width), r13=58(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 354
LDI r1, 214
LDI r2, 24
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 190
LDI r6, 232
LDI r7, 307
LDI r8, 214
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 293
LDI r11, 96
LDI r12, 97
LDI r13, 58
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
