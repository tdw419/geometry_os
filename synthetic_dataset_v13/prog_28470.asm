; DESCRIPTION: Composite: Places a red circle of radius 57 at center (446, 140) then Renders a yellow line between points (65, 178) and (335, 182) then Places a magenta 59x11 rectangle at position (159, 80).
; PLAN: r0=446(x), r1=140(y), r2=57(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=65(x1), r6=178(y1), r7=335(x2), r8=182(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=159(x), r11=80(y), r12=59(width), r13=11(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 446
LDI r1, 140
LDI r2, 57
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 65
LDI r6, 178
LDI r7, 335
LDI r8, 182
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 159
LDI r11, 80
LDI r12, 59
LDI r13, 11
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
