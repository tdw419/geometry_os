; DESCRIPTION: Composite: Draws a white circle centered at (171, 91) with radius 80 then Places a black 25x27 rectangle at position (261, 82) then Draws a magenta line from (412, 48) to (448, 10).
; PLAN: r0=171(x), r1=91(y), r2=80(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=261(x), r6=82(y), r7=25(width), r8=27(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=412(x1), r11=48(y1), r12=448(x2), r13=10(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 171
LDI r1, 91
LDI r2, 80
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 261
LDI r6, 82
LDI r7, 25
LDI r8, 27
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 412
LDI r11, 48
LDI r12, 448
LDI r13, 10
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
