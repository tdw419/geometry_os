; DESCRIPTION: Composite: Places a magenta 47x21 rectangle at position (291, 143) then Renders a white disk with center (58, 87) and radius 42 then Renders a orange line between points (485, 212) and (358, 117).
; PLAN: r0=291(x), r1=143(y), r2=47(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=58(x), r6=87(y), r7=42(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=485(x1), r11=212(y1), r12=358(x2), r13=117(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 291
LDI r1, 143
LDI r2, 47
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 58
LDI r6, 87
LDI r7, 42
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 485
LDI r11, 212
LDI r12, 358
LDI r13, 117
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
