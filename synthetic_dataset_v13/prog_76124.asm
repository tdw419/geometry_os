; DESCRIPTION: Composite: Sets a single cyan pixel at (217, 210) then Places a yellow 57x119 rectangle at position (357, 94) then Draws a cyan line from (399, 199) to (124, 217).
; PLAN: r0=217(x), r1=210(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=357(x), r6=94(y), r7=57(width), r8=119(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=399(x1), r11=199(y1), r12=124(x2), r13=217(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 217
LDI r1, 210
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 357
LDI r6, 94
LDI r7, 57
LDI r8, 119
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 399
LDI r11, 199
LDI r12, 124
LDI r13, 217
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
