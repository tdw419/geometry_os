; DESCRIPTION: Composite: Renders a white line between points (508, 120) and (479, 103) then Places a yellow circle of radius 24 at center (30, 74) then Creates a blue rectangular region at (281, 162) spanning 66 by 21 pixels.
; PLAN: r0=508(x1), r1=120(y1), r2=479(x2), r3=103(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=30(x), r6=74(y), r7=24(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=281(x), r11=162(y), r12=66(width), r13=21(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 508
LDI r1, 120
LDI r2, 479
LDI r3, 103
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 30
LDI r6, 74
LDI r7, 24
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 281
LDI r11, 162
LDI r12, 66
LDI r13, 21
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
