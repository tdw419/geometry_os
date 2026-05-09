; DESCRIPTION: Composite: Creates a magenta circular shape at (373, 63) with radius 45 then Draws a blue line from (415, 38) to (307, 109) then Places a black 21x82 rectangle at position (34, 125).
; PLAN: r0=373(x), r1=63(y), r2=45(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=415(x1), r6=38(y1), r7=307(x2), r8=109(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=34(x), r11=125(y), r12=21(width), r13=82(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 373
LDI r1, 63
LDI r2, 45
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 415
LDI r6, 38
LDI r7, 307
LDI r8, 109
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 34
LDI r11, 125
LDI r12, 21
LDI r13, 82
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
