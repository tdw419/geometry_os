; DESCRIPTION: Composite: Places a blue circle of radius 49 at center (222, 148) then Renders a red line between points (8, 68) and (412, 24).
; PLAN: r0=222(x), r1=148(y), r2=49(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=8(x1), r6=68(y1), r7=412(x2), r8=24(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 222
LDI r1, 148
LDI r2, 49
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 8
LDI r6, 68
LDI r7, 412
LDI r8, 24
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
