; DESCRIPTION: Composite: Places a red dot at position (79, 25) then Places a magenta line segment connecting (260, 134) to (134, 139) then Renders a white box of size 46x65 starting at (212, 190).
; PLAN: r0=79(x), r1=25(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=260(x1), r6=134(y1), r7=134(x2), r8=139(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=212(x), r11=190(y), r12=46(width), r13=65(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 79
LDI r1, 25
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 260
LDI r6, 134
LDI r7, 134
LDI r8, 139
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 212
LDI r11, 190
LDI r12, 46
LDI r13, 65
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
