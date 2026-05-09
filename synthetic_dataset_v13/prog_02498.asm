; DESCRIPTION: Composite: Renders a purple disk with center (349, 185) and radius 59 then Renders a purple box of size 81x90 starting at (386, 59) then Places a red line segment connecting (395, 116) to (197, 180).
; PLAN: r0=349(x), r1=185(y), r2=59(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=386(x), r6=59(y), r7=81(width), r8=90(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=395(x1), r11=116(y1), r12=197(x2), r13=180(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 349
LDI r1, 185
LDI r2, 59
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 386
LDI r6, 59
LDI r7, 81
LDI r8, 90
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 395
LDI r11, 116
LDI r12, 197
LDI r13, 180
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
