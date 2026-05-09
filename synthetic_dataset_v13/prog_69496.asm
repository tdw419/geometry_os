; DESCRIPTION: Composite: Places a green line segment connecting (142, 90) to (262, 238) then Renders a blue disk with center (380, 85) and radius 77 then Renders a black box of size 22x25 starting at (183, 139).
; PLAN: r0=142(x1), r1=90(y1), r2=262(x2), r3=238(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=380(x), r6=85(y), r7=77(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=183(x), r11=139(y), r12=22(width), r13=25(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 142
LDI r1, 90
LDI r2, 262
LDI r3, 238
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 380
LDI r6, 85
LDI r7, 77
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 183
LDI r11, 139
LDI r12, 22
LDI r13, 25
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
