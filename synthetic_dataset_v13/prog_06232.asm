; DESCRIPTION: Composite: Places a orange dot at position (247, 216) then Creates a blue rectangular region at (112, 134) spanning 120 by 57 pixels then Places a green circle of radius 14 at center (63, 162).
; PLAN: r0=247(x), r1=216(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=112(x), r6=134(y), r7=120(width), r8=57(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=63(x), r11=162(y), r12=14(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 247
LDI r1, 216
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 112
LDI r6, 134
LDI r7, 120
LDI r8, 57
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 63
LDI r11, 162
LDI r12, 14
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
