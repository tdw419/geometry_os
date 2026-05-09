; DESCRIPTION: Composite: Sets a single orange pixel at (106, 158) then Draws a cyan line from (19, 194) to (281, 247) then Renders a purple box of size 119x107 starting at (315, 69).
; PLAN: r0=106(x), r1=158(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=19(x1), r6=194(y1), r7=281(x2), r8=247(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=315(x), r11=69(y), r12=119(width), r13=107(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 106
LDI r1, 158
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 19
LDI r6, 194
LDI r7, 281
LDI r8, 247
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 315
LDI r11, 69
LDI r12, 119
LDI r13, 107
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
