; DESCRIPTION: Composite: Places a purple line segment connecting (287, 146) to (359, 242) then Renders a yellow box of size 78x42 starting at (381, 27) then Sets a single magenta pixel at (28, 15).
; PLAN: r0=287(x1), r1=146(y1), r2=359(x2), r3=242(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=381(x), r6=27(y), r7=78(width), r8=42(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=28(x), r11=15(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 287
LDI r1, 146
LDI r2, 359
LDI r3, 242
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 381
LDI r6, 27
LDI r7, 78
LDI r8, 42
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 28
LDI r11, 15
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
