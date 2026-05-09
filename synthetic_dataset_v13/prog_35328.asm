; DESCRIPTION: Composite: Renders a black line between points (75, 140) and (157, 213) then Renders a white box of size 63x102 starting at (150, 17) then Places a blue circle of radius 36 at center (269, 120).
; PLAN: r0=75(x1), r1=140(y1), r2=157(x2), r3=213(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=150(x), r6=17(y), r7=63(width), r8=102(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=269(x), r11=120(y), r12=36(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 75
LDI r1, 140
LDI r2, 157
LDI r3, 213
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 150
LDI r6, 17
LDI r7, 63
LDI r8, 102
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 269
LDI r11, 120
LDI r12, 36
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
