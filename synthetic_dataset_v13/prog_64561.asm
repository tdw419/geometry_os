; DESCRIPTION: Composite: Renders a cyan disk with center (76, 111) and radius 28 then Draws a green line from (40, 65) to (168, 158) then Renders a purple box of size 100x33 starting at (341, 116).
; PLAN: r0=76(x), r1=111(y), r2=28(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=40(x1), r6=65(y1), r7=168(x2), r8=158(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=341(x), r11=116(y), r12=100(width), r13=33(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 76
LDI r1, 111
LDI r2, 28
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 40
LDI r6, 65
LDI r7, 168
LDI r8, 158
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 341
LDI r11, 116
LDI r12, 100
LDI r13, 33
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
