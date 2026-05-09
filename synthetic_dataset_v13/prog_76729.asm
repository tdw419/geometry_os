; DESCRIPTION: Composite: Places a orange dot at position (204, 49) then Places a magenta 34x10 rectangle at position (274, 54) then Draws a red line from (388, 220) to (28, 216).
; PLAN: r0=204(x), r1=49(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=274(x), r6=54(y), r7=34(width), r8=10(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=388(x1), r11=220(y1), r12=28(x2), r13=216(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 204
LDI r1, 49
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 274
LDI r6, 54
LDI r7, 34
LDI r8, 10
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 388
LDI r11, 220
LDI r12, 28
LDI r13, 216
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
