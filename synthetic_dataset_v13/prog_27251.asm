; DESCRIPTION: Composite: Places a magenta 92x84 rectangle at position (313, 55) then Draws a yellow circle centered at (440, 187) with radius 13 then Draws a cyan line from (391, 64) to (49, 44).
; PLAN: r0=313(x), r1=55(y), r2=92(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=440(x), r6=187(y), r7=13(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=391(x1), r11=64(y1), r12=49(x2), r13=44(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 313
LDI r1, 55
LDI r2, 92
LDI r3, 84
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 440
LDI r6, 187
LDI r7, 13
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 391
LDI r11, 64
LDI r12, 49
LDI r13, 44
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
