; DESCRIPTION: Composite: Renders a purple line between points (295, 148) and (487, 24) then Places a blue 75x43 rectangle at position (372, 88).
; PLAN: r0=295(x1), r1=148(y1), r2=487(x2), r3=24(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=372(x), r6=88(y), r7=75(width), r8=43(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 295
LDI r1, 148
LDI r2, 487
LDI r3, 24
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 372
LDI r6, 88
LDI r7, 75
LDI r8, 43
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
