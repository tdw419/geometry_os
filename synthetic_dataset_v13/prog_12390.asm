; DESCRIPTION: Composite: Renders a cyan line between points (329, 212) and (99, 19) then Creates a purple rectangular region at (185, 138) spanning 56 by 47 pixels.
; PLAN: r0=329(x1), r1=212(y1), r2=99(x2), r3=19(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=185(x), r6=138(y), r7=56(width), r8=47(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 329
LDI r1, 212
LDI r2, 99
LDI r3, 19
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 185
LDI r6, 138
LDI r7, 56
LDI r8, 47
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
