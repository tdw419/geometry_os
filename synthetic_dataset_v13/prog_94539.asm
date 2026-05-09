; DESCRIPTION: Composite: Draws a yellow line from (104, 170) to (180, 144) then Draws a magenta circle centered at (99, 143) with radius 48 then Places a white 48x32 rectangle at position (81, 168).
; PLAN: r0=104(x1), r1=170(y1), r2=180(x2), r3=144(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=99(x), r6=143(y), r7=48(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=81(x), r11=168(y), r12=48(width), r13=32(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 104
LDI r1, 170
LDI r2, 180
LDI r3, 144
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 99
LDI r6, 143
LDI r7, 48
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 81
LDI r11, 168
LDI r12, 48
LDI r13, 32
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
