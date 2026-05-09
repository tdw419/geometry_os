; DESCRIPTION: Composite: Places a purple line segment connecting (131, 204) to (282, 49) then Renders a purple disk with center (217, 71) and radius 68 then Renders a magenta box of size 16x90 starting at (221, 146).
; PLAN: r0=131(x1), r1=204(y1), r2=282(x2), r3=49(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=217(x), r6=71(y), r7=68(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=221(x), r11=146(y), r12=16(width), r13=90(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 131
LDI r1, 204
LDI r2, 282
LDI r3, 49
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 217
LDI r6, 71
LDI r7, 68
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 221
LDI r11, 146
LDI r12, 16
LDI r13, 90
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
