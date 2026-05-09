; DESCRIPTION: Composite: Draws a magenta circle centered at (429, 175) with radius 76 then Draws a green line from (494, 64) to (420, 92) then Places a magenta 97x21 rectangle at position (262, 12).
; PLAN: r0=429(x), r1=175(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=494(x1), r6=64(y1), r7=420(x2), r8=92(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=262(x), r11=12(y), r12=97(width), r13=21(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 429
LDI r1, 175
LDI r2, 76
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 494
LDI r6, 64
LDI r7, 420
LDI r8, 92
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 262
LDI r11, 12
LDI r12, 97
LDI r13, 21
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
