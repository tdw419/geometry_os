; DESCRIPTION: Composite: Sets a single blue pixel at (279, 30) then Places a red line segment connecting (224, 65) to (396, 238) then Renders a magenta box of size 68x85 starting at (230, 54).
; PLAN: r0=279(x), r1=30(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=224(x1), r6=65(y1), r7=396(x2), r8=238(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=230(x), r11=54(y), r12=68(width), r13=85(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 279
LDI r1, 30
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 224
LDI r6, 65
LDI r7, 396
LDI r8, 238
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 230
LDI r11, 54
LDI r12, 68
LDI r13, 85
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
