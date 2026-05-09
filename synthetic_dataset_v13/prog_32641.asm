; DESCRIPTION: Composite: Draws a green line from (357, 194) to (128, 175) then Places a yellow circle of radius 32 at center (212, 46) then Places a white 114x54 rectangle at position (99, 27).
; PLAN: r0=357(x1), r1=194(y1), r2=128(x2), r3=175(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=212(x), r6=46(y), r7=32(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=99(x), r11=27(y), r12=114(width), r13=54(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 357
LDI r1, 194
LDI r2, 128
LDI r3, 175
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 212
LDI r6, 46
LDI r7, 32
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 99
LDI r11, 27
LDI r12, 114
LDI r13, 54
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
