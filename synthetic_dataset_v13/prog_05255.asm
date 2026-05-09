; DESCRIPTION: Composite: Draws a black line from (317, 120) to (36, 130) then Creates a magenta rectangular region at (87, 2) spanning 25 by 22 pixels then Places a cyan circle of radius 30 at center (304, 83).
; PLAN: r0=317(x1), r1=120(y1), r2=36(x2), r3=130(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=87(x), r6=2(y), r7=25(width), r8=22(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=304(x), r11=83(y), r12=30(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 317
LDI r1, 120
LDI r2, 36
LDI r3, 130
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 87
LDI r6, 2
LDI r7, 25
LDI r8, 22
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 304
LDI r11, 83
LDI r12, 30
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
