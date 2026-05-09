; DESCRIPTION: Composite: Places a purple 55x13 rectangle at position (393, 132) then Draws a yellow circle centered at (402, 131) with radius 62 then Draws a green line from (361, 129) to (276, 46).
; PLAN: r0=393(x), r1=132(y), r2=55(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=402(x), r6=131(y), r7=62(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=361(x1), r11=129(y1), r12=276(x2), r13=46(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 393
LDI r1, 132
LDI r2, 55
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 402
LDI r6, 131
LDI r7, 62
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 361
LDI r11, 129
LDI r12, 276
LDI r13, 46
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
