; DESCRIPTION: Composite: Renders a blue line between points (301, 253) and (355, 188) then Renders a white box of size 96x85 starting at (386, 36) then Sets a single purple pixel at (81, 1).
; PLAN: r0=301(x1), r1=253(y1), r2=355(x2), r3=188(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=386(x), r6=36(y), r7=96(width), r8=85(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=81(x), r11=1(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 301
LDI r1, 253
LDI r2, 355
LDI r3, 188
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 386
LDI r6, 36
LDI r7, 96
LDI r8, 85
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 81
LDI r11, 1
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
