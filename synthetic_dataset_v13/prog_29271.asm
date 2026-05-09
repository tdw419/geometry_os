; DESCRIPTION: Composite: Places a magenta line segment connecting (348, 96) to (279, 160) then Renders a magenta disk with center (246, 74) and radius 38 then Places a magenta 24x80 rectangle at position (41, 14).
; PLAN: r0=348(x1), r1=96(y1), r2=279(x2), r3=160(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=246(x), r6=74(y), r7=38(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=41(x), r11=14(y), r12=24(width), r13=80(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 348
LDI r1, 96
LDI r2, 279
LDI r3, 160
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 246
LDI r6, 74
LDI r7, 38
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 41
LDI r11, 14
LDI r12, 24
LDI r13, 80
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
