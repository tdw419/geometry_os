; DESCRIPTION: Composite: Draws a green line from (299, 92) to (93, 60) then Renders a purple disk with center (349, 145) and radius 37 then Draws a white rectangle at (370, 23) with width 28 and height 50.
; PLAN: r0=299(x1), r1=92(y1), r2=93(x2), r3=60(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=349(x), r6=145(y), r7=37(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=370(x), r11=23(y), r12=28(width), r13=50(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 299
LDI r1, 92
LDI r2, 93
LDI r3, 60
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 349
LDI r6, 145
LDI r7, 37
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 370
LDI r11, 23
LDI r12, 28
LDI r13, 50
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
