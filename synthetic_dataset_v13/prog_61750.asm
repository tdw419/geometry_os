; DESCRIPTION: Composite: Renders a green disk with center (139, 197) and radius 30 then Renders a purple box of size 78x42 starting at (238, 145) then Draws a purple line from (446, 106) to (202, 133).
; PLAN: r0=139(x), r1=197(y), r2=30(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=238(x), r6=145(y), r7=78(width), r8=42(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=446(x1), r11=106(y1), r12=202(x2), r13=133(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 139
LDI r1, 197
LDI r2, 30
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 238
LDI r6, 145
LDI r7, 78
LDI r8, 42
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 446
LDI r11, 106
LDI r12, 202
LDI r13, 133
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
