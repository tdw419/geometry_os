; DESCRIPTION: Composite: Places a green 90x35 rectangle at position (115, 133) then Places a cyan circle of radius 71 at center (89, 109) then Places a cyan line segment connecting (274, 248) to (262, 156).
; PLAN: r0=115(x), r1=133(y), r2=90(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=89(x), r6=109(y), r7=71(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=274(x1), r11=248(y1), r12=262(x2), r13=156(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 115
LDI r1, 133
LDI r2, 90
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 89
LDI r6, 109
LDI r7, 71
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 274
LDI r11, 248
LDI r12, 262
LDI r13, 156
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
