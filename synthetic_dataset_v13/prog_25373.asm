; DESCRIPTION: Composite: Places a yellow line segment connecting (72, 175) to (459, 226) then Places a magenta 73x71 rectangle at position (386, 70) then Places a yellow circle of radius 23 at center (431, 125).
; PLAN: r0=72(x1), r1=175(y1), r2=459(x2), r3=226(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=386(x), r6=70(y), r7=73(width), r8=71(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=431(x), r11=125(y), r12=23(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 72
LDI r1, 175
LDI r2, 459
LDI r3, 226
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 386
LDI r6, 70
LDI r7, 73
LDI r8, 71
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 431
LDI r11, 125
LDI r12, 23
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
