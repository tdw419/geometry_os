; DESCRIPTION: Composite: Creates a purple rectangular region at (218, 130) spanning 39 by 108 pixels then Renders a magenta line between points (294, 179) and (79, 88) then Places a purple dot at position (319, 99).
; PLAN: r0=218(x), r1=130(y), r2=39(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=294(x1), r6=179(y1), r7=79(x2), r8=88(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=319(x), r11=99(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 218
LDI r1, 130
LDI r2, 39
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 294
LDI r6, 179
LDI r7, 79
LDI r8, 88
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 319
LDI r11, 99
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
