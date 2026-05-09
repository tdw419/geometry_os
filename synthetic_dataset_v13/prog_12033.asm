; DESCRIPTION: Composite: Places a red 53x91 rectangle at position (191, 150) then Places a yellow circle of radius 61 at center (290, 178) then Renders a orange line between points (32, 56) and (431, 16).
; PLAN: r0=191(x), r1=150(y), r2=53(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=290(x), r6=178(y), r7=61(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=32(x1), r11=56(y1), r12=431(x2), r13=16(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 191
LDI r1, 150
LDI r2, 53
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 290
LDI r6, 178
LDI r7, 61
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 32
LDI r11, 56
LDI r12, 431
LDI r13, 16
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
