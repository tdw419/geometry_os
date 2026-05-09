; DESCRIPTION: Composite: Places a orange dot at position (28, 74) then Renders a blue line between points (206, 216) and (337, 43) then Places a yellow circle of radius 68 at center (91, 69).
; PLAN: r0=28(x), r1=74(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=206(x1), r6=216(y1), r7=337(x2), r8=43(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=91(x), r11=69(y), r12=68(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 28
LDI r1, 74
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 206
LDI r6, 216
LDI r7, 337
LDI r8, 43
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 91
LDI r11, 69
LDI r12, 68
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
