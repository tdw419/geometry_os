; DESCRIPTION: Composite: Draws a black line from (40, 154) to (386, 53) then Draws a cyan circle centered at (235, 229) with radius 11 then Places a red 53x100 rectangle at position (108, 87).
; PLAN: r0=40(x1), r1=154(y1), r2=386(x2), r3=53(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=235(x), r6=229(y), r7=11(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=108(x), r11=87(y), r12=53(width), r13=100(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 40
LDI r1, 154
LDI r2, 386
LDI r3, 53
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 235
LDI r6, 229
LDI r7, 11
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 108
LDI r11, 87
LDI r12, 53
LDI r13, 100
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
