; DESCRIPTION: Composite: Renders a purple box of size 77x101 starting at (262, 140) then Places a magenta line segment connecting (363, 242) to (80, 83) then Places a magenta dot at position (130, 12).
; PLAN: r0=262(x), r1=140(y), r2=77(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=363(x1), r6=242(y1), r7=80(x2), r8=83(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=130(x), r11=12(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 262
LDI r1, 140
LDI r2, 77
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 363
LDI r6, 242
LDI r7, 80
LDI r8, 83
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 130
LDI r11, 12
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
