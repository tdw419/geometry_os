; DESCRIPTION: Composite: Renders a yellow box of size 77x88 starting at (61, 30) then Places a yellow line segment connecting (279, 1) to (195, 27) then Sets a single white pixel at (90, 196).
; PLAN: r0=61(x), r1=30(y), r2=77(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=279(x1), r6=1(y1), r7=195(x2), r8=27(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=90(x), r11=196(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 61
LDI r1, 30
LDI r2, 77
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 279
LDI r6, 1
LDI r7, 195
LDI r8, 27
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 90
LDI r11, 196
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
