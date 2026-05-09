; DESCRIPTION: Composite: Sets a single purple pixel at (162, 142) then Renders a green box of size 73x77 starting at (302, 126) then Draws a yellow circle centered at (279, 106) with radius 65.
; PLAN: r0=162(x), r1=142(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=302(x), r6=126(y), r7=73(width), r8=77(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=279(x), r11=106(y), r12=65(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 162
LDI r1, 142
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 302
LDI r6, 126
LDI r7, 73
LDI r8, 77
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 279
LDI r11, 106
LDI r12, 65
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
