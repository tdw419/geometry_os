; DESCRIPTION: Composite: Sets a single white pixel at (393, 125) then Renders a green line between points (403, 212) and (213, 185) then Creates a black rectangular region at (36, 167) spanning 66 by 43 pixels.
; PLAN: r0=393(x), r1=125(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=403(x1), r6=212(y1), r7=213(x2), r8=185(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=36(x), r11=167(y), r12=66(width), r13=43(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 393
LDI r1, 125
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 403
LDI r6, 212
LDI r7, 213
LDI r8, 185
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 36
LDI r11, 167
LDI r12, 66
LDI r13, 43
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
