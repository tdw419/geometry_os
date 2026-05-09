; DESCRIPTION: Composite: Renders a red line between points (0, 52) and (86, 216) then Places a green 10x20 rectangle at position (401, 230) then Renders a blue disk with center (355, 120) and radius 32.
; PLAN: r0=0(x1), r1=52(y1), r2=86(x2), r3=216(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=401(x), r6=230(y), r7=10(width), r8=20(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=355(x), r11=120(y), r12=32(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 0
LDI r1, 52
LDI r2, 86
LDI r3, 216
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 401
LDI r6, 230
LDI r7, 10
LDI r8, 20
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 355
LDI r11, 120
LDI r12, 32
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
