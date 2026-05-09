; DESCRIPTION: Composite: Places a green circle of radius 37 at center (210, 70) then Renders a black line between points (503, 60) and (390, 103) then Renders a green box of size 75x36 starting at (365, 167).
; PLAN: r0=210(x), r1=70(y), r2=37(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=503(x1), r6=60(y1), r7=390(x2), r8=103(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=365(x), r11=167(y), r12=75(width), r13=36(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 210
LDI r1, 70
LDI r2, 37
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 503
LDI r6, 60
LDI r7, 390
LDI r8, 103
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 365
LDI r11, 167
LDI r12, 75
LDI r13, 36
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
