; DESCRIPTION: Composite: Renders a blue line between points (37, 184) and (398, 34) then Places a orange circle of radius 64 at center (145, 135) then Places a red 80x38 rectangle at position (213, 196).
; PLAN: r0=37(x1), r1=184(y1), r2=398(x2), r3=34(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=145(x), r6=135(y), r7=64(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=213(x), r11=196(y), r12=80(width), r13=38(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 37
LDI r1, 184
LDI r2, 398
LDI r3, 34
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 145
LDI r6, 135
LDI r7, 64
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 213
LDI r11, 196
LDI r12, 80
LDI r13, 38
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
