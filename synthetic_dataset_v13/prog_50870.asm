; DESCRIPTION: Composite: Renders a orange line between points (392, 111) and (454, 183) then Draws a white circle centered at (32, 77) with radius 31 then Renders a yellow box of size 16x94 starting at (271, 115).
; PLAN: r0=392(x1), r1=111(y1), r2=454(x2), r3=183(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=32(x), r6=77(y), r7=31(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=271(x), r11=115(y), r12=16(width), r13=94(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 392
LDI r1, 111
LDI r2, 454
LDI r3, 183
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 32
LDI r6, 77
LDI r7, 31
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 271
LDI r11, 115
LDI r12, 16
LDI r13, 94
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
