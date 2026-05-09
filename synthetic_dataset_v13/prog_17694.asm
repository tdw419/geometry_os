; DESCRIPTION: Composite: Renders a purple box of size 47x97 starting at (338, 78) then Draws a green circle centered at (186, 80) with radius 57 then Renders a cyan line between points (209, 124) and (18, 97).
; PLAN: r0=338(x), r1=78(y), r2=47(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=186(x), r6=80(y), r7=57(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=209(x1), r11=124(y1), r12=18(x2), r13=97(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 338
LDI r1, 78
LDI r2, 47
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 186
LDI r6, 80
LDI r7, 57
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 209
LDI r11, 124
LDI r12, 18
LDI r13, 97
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
