; DESCRIPTION: Composite: Renders a black line between points (442, 138) and (63, 135) then Renders a blue disk with center (416, 209) and radius 40 then Renders a red box of size 107x96 starting at (231, 44).
; PLAN: r0=442(x1), r1=138(y1), r2=63(x2), r3=135(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=416(x), r6=209(y), r7=40(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=231(x), r11=44(y), r12=107(width), r13=96(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 442
LDI r1, 138
LDI r2, 63
LDI r3, 135
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 416
LDI r6, 209
LDI r7, 40
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 231
LDI r11, 44
LDI r12, 107
LDI r13, 96
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
