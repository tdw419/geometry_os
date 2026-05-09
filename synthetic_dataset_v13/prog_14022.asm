; DESCRIPTION: Composite: Renders a magenta line between points (150, 28) and (236, 177) then Creates a green rectangular region at (85, 36) spanning 112 by 80 pixels then Places a white dot at position (10, 20).
; PLAN: r0=150(x1), r1=28(y1), r2=236(x2), r3=177(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=85(x), r6=36(y), r7=112(width), r8=80(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=10(x), r11=20(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 150
LDI r1, 28
LDI r2, 236
LDI r3, 177
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 85
LDI r6, 36
LDI r7, 112
LDI r8, 80
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 10
LDI r11, 20
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
