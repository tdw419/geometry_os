; DESCRIPTION: Composite: Sets a single black pixel at (179, 185) then Renders a red line between points (294, 38) and (168, 193) then Renders a blue box of size 87x100 starting at (55, 38).
; PLAN: r0=179(x), r1=185(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=294(x1), r6=38(y1), r7=168(x2), r8=193(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=55(x), r11=38(y), r12=87(width), r13=100(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 179
LDI r1, 185
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 294
LDI r6, 38
LDI r7, 168
LDI r8, 193
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 55
LDI r11, 38
LDI r12, 87
LDI r13, 100
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
