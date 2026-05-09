; DESCRIPTION: Composite: Renders a magenta line between points (241, 200) and (190, 48) then Places a magenta 113x77 rectangle at position (22, 73) then Sets a single magenta pixel at (439, 67).
; PLAN: r0=241(x1), r1=200(y1), r2=190(x2), r3=48(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=22(x), r6=73(y), r7=113(width), r8=77(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=439(x), r11=67(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 241
LDI r1, 200
LDI r2, 190
LDI r3, 48
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 22
LDI r6, 73
LDI r7, 113
LDI r8, 77
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 439
LDI r11, 67
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
