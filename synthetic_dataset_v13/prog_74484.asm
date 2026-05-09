; DESCRIPTION: Composite: Sets a single white pixel at (55, 34) then Renders a cyan line between points (209, 243) and (409, 157) then Creates a purple rectangular region at (51, 140) spanning 83 by 27 pixels.
; PLAN: r0=55(x), r1=34(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=209(x1), r6=243(y1), r7=409(x2), r8=157(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=51(x), r11=140(y), r12=83(width), r13=27(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 55
LDI r1, 34
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 209
LDI r6, 243
LDI r7, 409
LDI r8, 157
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 51
LDI r11, 140
LDI r12, 83
LDI r13, 27
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
