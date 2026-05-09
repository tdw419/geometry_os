; DESCRIPTION: Composite: Renders a black disk with center (246, 182) and radius 71 then Renders a red line between points (435, 180) and (385, 7) then Renders a black box of size 36x86 starting at (202, 58).
; PLAN: r0=246(x), r1=182(y), r2=71(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=435(x1), r6=180(y1), r7=385(x2), r8=7(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=202(x), r11=58(y), r12=36(width), r13=86(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 246
LDI r1, 182
LDI r2, 71
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 435
LDI r6, 180
LDI r7, 385
LDI r8, 7
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 202
LDI r11, 58
LDI r12, 36
LDI r13, 86
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
