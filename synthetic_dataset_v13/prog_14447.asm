; DESCRIPTION: Composite: Renders a orange line between points (37, 63) and (485, 244) then Creates a red circular shape at (275, 202) with radius 44 then Places a yellow 39x89 rectangle at position (117, 152).
; PLAN: r0=37(x1), r1=63(y1), r2=485(x2), r3=244(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=275(x), r6=202(y), r7=44(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=117(x), r11=152(y), r12=39(width), r13=89(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 37
LDI r1, 63
LDI r2, 485
LDI r3, 244
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 275
LDI r6, 202
LDI r7, 44
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 117
LDI r11, 152
LDI r12, 39
LDI r13, 89
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
