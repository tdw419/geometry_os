; DESCRIPTION: Composite: Sets a single purple pixel at (341, 190) then Places a magenta line segment connecting (323, 35) to (315, 125) then Renders a magenta box of size 42x75 starting at (383, 77).
; PLAN: r0=341(x), r1=190(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=323(x1), r6=35(y1), r7=315(x2), r8=125(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=383(x), r11=77(y), r12=42(width), r13=75(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 341
LDI r1, 190
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 323
LDI r6, 35
LDI r7, 315
LDI r8, 125
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 383
LDI r11, 77
LDI r12, 42
LDI r13, 75
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
