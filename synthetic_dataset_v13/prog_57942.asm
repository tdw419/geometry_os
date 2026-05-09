; DESCRIPTION: Composite: Renders a black line between points (448, 77) and (412, 228) then Renders a red disk with center (469, 53) and radius 35 then Places a yellow 48x23 rectangle at position (350, 229).
; PLAN: r0=448(x1), r1=77(y1), r2=412(x2), r3=228(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=469(x), r6=53(y), r7=35(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=350(x), r11=229(y), r12=48(width), r13=23(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 448
LDI r1, 77
LDI r2, 412
LDI r3, 228
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 469
LDI r6, 53
LDI r7, 35
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 350
LDI r11, 229
LDI r12, 48
LDI r13, 23
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
