; DESCRIPTION: Composite: Renders a orange line between points (354, 55) and (308, 83) then Renders a purple disk with center (219, 89) and radius 42 then Creates a magenta rectangular region at (228, 77) spanning 90 by 33 pixels.
; PLAN: r0=354(x1), r1=55(y1), r2=308(x2), r3=83(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=219(x), r6=89(y), r7=42(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=228(x), r11=77(y), r12=90(width), r13=33(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 354
LDI r1, 55
LDI r2, 308
LDI r3, 83
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 219
LDI r6, 89
LDI r7, 42
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 228
LDI r11, 77
LDI r12, 90
LDI r13, 33
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
