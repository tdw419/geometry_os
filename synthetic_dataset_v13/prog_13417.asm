; DESCRIPTION: Composite: Renders a purple disk with center (277, 230) and radius 24 then Renders a cyan line between points (157, 108) and (80, 212) then Places a magenta 34x107 rectangle at position (191, 118).
; PLAN: r0=277(x), r1=230(y), r2=24(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=157(x1), r6=108(y1), r7=80(x2), r8=212(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=191(x), r11=118(y), r12=34(width), r13=107(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 277
LDI r1, 230
LDI r2, 24
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 157
LDI r6, 108
LDI r7, 80
LDI r8, 212
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 191
LDI r11, 118
LDI r12, 34
LDI r13, 107
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
