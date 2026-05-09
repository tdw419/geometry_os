; DESCRIPTION: Composite: Renders a red box of size 114x71 starting at (44, 182) then Renders a green line between points (54, 230) and (201, 193) then Places a magenta circle of radius 70 at center (171, 86).
; PLAN: r0=44(x), r1=182(y), r2=114(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=54(x1), r6=230(y1), r7=201(x2), r8=193(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=171(x), r11=86(y), r12=70(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 44
LDI r1, 182
LDI r2, 114
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 54
LDI r6, 230
LDI r7, 201
LDI r8, 193
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 171
LDI r11, 86
LDI r12, 70
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
