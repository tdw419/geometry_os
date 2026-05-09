; DESCRIPTION: Composite: Creates a cyan rectangular region at (279, 5) spanning 81 by 118 pixels then Places a yellow line segment connecting (145, 65) to (341, 82).
; PLAN: r0=279(x), r1=5(y), r2=81(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=145(x1), r6=65(y1), r7=341(x2), r8=82(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 279
LDI r1, 5
LDI r2, 81
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 145
LDI r6, 65
LDI r7, 341
LDI r8, 82
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
