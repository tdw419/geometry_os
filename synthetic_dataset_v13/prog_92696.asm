; DESCRIPTION: Composite: Sets a single black pixel at (486, 146) then Renders a green box of size 38x70 starting at (254, 68) then Renders a purple line between points (338, 42) and (237, 131).
; PLAN: r0=486(x), r1=146(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=254(x), r6=68(y), r7=38(width), r8=70(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=338(x1), r11=42(y1), r12=237(x2), r13=131(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 486
LDI r1, 146
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 254
LDI r6, 68
LDI r7, 38
LDI r8, 70
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 338
LDI r11, 42
LDI r12, 237
LDI r13, 131
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
