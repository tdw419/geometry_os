; DESCRIPTION: Composite: Places a black circle of radius 76 at center (363, 150) then Draws a cyan line from (182, 251) to (72, 150) then Renders a blue box of size 48x62 starting at (30, 80).
; PLAN: r0=363(x), r1=150(y), r2=76(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=182(x1), r6=251(y1), r7=72(x2), r8=150(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=30(x), r11=80(y), r12=48(width), r13=62(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 363
LDI r1, 150
LDI r2, 76
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 182
LDI r6, 251
LDI r7, 72
LDI r8, 150
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 30
LDI r11, 80
LDI r12, 48
LDI r13, 62
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
