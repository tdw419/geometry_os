; DESCRIPTION: Composite: Creates a magenta circular shape at (323, 68) with radius 61 then Places a green dot at position (293, 228) then Draws a purple rectangle at (369, 95) with width 56 and height 99.
; PLAN: r0=323(x), r1=68(y), r2=61(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=293(x), r6=228(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=369(x), r11=95(y), r12=56(width), r13=99(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 323
LDI r1, 68
LDI r2, 61
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 293
LDI r6, 228
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 369
LDI r11, 95
LDI r12, 56
LDI r13, 99
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
