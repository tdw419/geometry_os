; DESCRIPTION: Composite: Renders a orange box of size 103x20 starting at (124, 85) then Sets a single green pixel at (300, 205) then Renders a purple line between points (190, 116) and (26, 141).
; PLAN: r0=124(x), r1=85(y), r2=103(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=300(x), r6=205(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=190(x1), r11=116(y1), r12=26(x2), r13=141(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 124
LDI r1, 85
LDI r2, 103
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 300
LDI r6, 205
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 190
LDI r11, 116
LDI r12, 26
LDI r13, 141
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
