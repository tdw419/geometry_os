; DESCRIPTION: Composite: Places a blue circle of radius 18 at center (354, 158) then Places a cyan 96x20 rectangle at position (228, 83) then Renders a blue line between points (435, 37) and (324, 201).
; PLAN: r0=354(x), r1=158(y), r2=18(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=228(x), r6=83(y), r7=96(width), r8=20(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=435(x1), r11=37(y1), r12=324(x2), r13=201(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 354
LDI r1, 158
LDI r2, 18
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 228
LDI r6, 83
LDI r7, 96
LDI r8, 20
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 435
LDI r11, 37
LDI r12, 324
LDI r13, 201
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
