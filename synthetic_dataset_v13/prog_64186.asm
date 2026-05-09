; DESCRIPTION: Composite: Creates a orange circular shape at (145, 77) with radius 77 then Renders a green line between points (484, 134) and (455, 169) then Renders a cyan box of size 73x96 starting at (400, 128).
; PLAN: r0=145(x), r1=77(y), r2=77(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=484(x1), r6=134(y1), r7=455(x2), r8=169(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=400(x), r11=128(y), r12=73(width), r13=96(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 145
LDI r1, 77
LDI r2, 77
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 484
LDI r6, 134
LDI r7, 455
LDI r8, 169
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 400
LDI r11, 128
LDI r12, 73
LDI r13, 96
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
