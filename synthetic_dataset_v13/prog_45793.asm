; DESCRIPTION: Composite: Creates a blue circular shape at (373, 209) with radius 21 then Renders a blue box of size 33x92 starting at (219, 10) then Renders a yellow line between points (439, 194) and (500, 132).
; PLAN: r0=373(x), r1=209(y), r2=21(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=219(x), r6=10(y), r7=33(width), r8=92(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=439(x1), r11=194(y1), r12=500(x2), r13=132(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 373
LDI r1, 209
LDI r2, 21
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 219
LDI r6, 10
LDI r7, 33
LDI r8, 92
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 439
LDI r11, 194
LDI r12, 500
LDI r13, 132
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
