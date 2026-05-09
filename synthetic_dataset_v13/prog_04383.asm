; DESCRIPTION: Composite: Renders a red line between points (156, 89) and (38, 93) then Renders a black disk with center (316, 240) and radius 16 then Renders a cyan box of size 106x111 starting at (377, 123).
; PLAN: r0=156(x1), r1=89(y1), r2=38(x2), r3=93(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=316(x), r6=240(y), r7=16(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=377(x), r11=123(y), r12=106(width), r13=111(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 156
LDI r1, 89
LDI r2, 38
LDI r3, 93
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 316
LDI r6, 240
LDI r7, 16
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 377
LDI r11, 123
LDI r12, 106
LDI r13, 111
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
