; DESCRIPTION: Composite: Draws a green circle centered at (260, 152) with radius 56 then Renders a black box of size 80x93 starting at (288, 60) then Renders a cyan line between points (261, 208) and (462, 34).
; PLAN: r0=260(x), r1=152(y), r2=56(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=288(x), r6=60(y), r7=80(width), r8=93(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=261(x1), r11=208(y1), r12=462(x2), r13=34(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 260
LDI r1, 152
LDI r2, 56
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 288
LDI r6, 60
LDI r7, 80
LDI r8, 93
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 261
LDI r11, 208
LDI r12, 462
LDI r13, 34
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
