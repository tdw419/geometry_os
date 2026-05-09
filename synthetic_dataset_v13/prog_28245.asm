; DESCRIPTION: Composite: Renders a magenta line between points (139, 181) and (504, 200) then Places a blue 65x22 rectangle at position (374, 15).
; PLAN: r0=139(x1), r1=181(y1), r2=504(x2), r3=200(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=374(x), r6=15(y), r7=65(width), r8=22(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 139
LDI r1, 181
LDI r2, 504
LDI r3, 200
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 374
LDI r6, 15
LDI r7, 65
LDI r8, 22
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
