; DESCRIPTION: Composite: Renders a white line between points (494, 97) and (178, 36) then Creates a magenta rectangular region at (213, 169) spanning 88 by 19 pixels.
; PLAN: r0=494(x1), r1=97(y1), r2=178(x2), r3=36(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=213(x), r6=169(y), r7=88(width), r8=19(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 494
LDI r1, 97
LDI r2, 178
LDI r3, 36
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 213
LDI r6, 169
LDI r7, 88
LDI r8, 19
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
