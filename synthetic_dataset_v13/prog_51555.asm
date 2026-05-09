; DESCRIPTION: Composite: Renders a purple disk with center (223, 170) and radius 71 then Places a red 101x28 rectangle at position (55, 189) then Draws a green line from (73, 72) to (182, 61).
; PLAN: r0=223(x), r1=170(y), r2=71(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=55(x), r6=189(y), r7=101(width), r8=28(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=73(x1), r11=72(y1), r12=182(x2), r13=61(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 223
LDI r1, 170
LDI r2, 71
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 55
LDI r6, 189
LDI r7, 101
LDI r8, 28
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 73
LDI r11, 72
LDI r12, 182
LDI r13, 61
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
