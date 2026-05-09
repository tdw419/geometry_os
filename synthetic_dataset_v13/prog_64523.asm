; DESCRIPTION: Composite: Places a purple 103x35 rectangle at position (168, 133) then Draws a purple circle centered at (48, 150) with radius 31 then Draws a white line from (485, 43) to (479, 78).
; PLAN: r0=168(x), r1=133(y), r2=103(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=48(x), r6=150(y), r7=31(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=485(x1), r11=43(y1), r12=479(x2), r13=78(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 168
LDI r1, 133
LDI r2, 103
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 48
LDI r6, 150
LDI r7, 31
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 485
LDI r11, 43
LDI r12, 479
LDI r13, 78
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
