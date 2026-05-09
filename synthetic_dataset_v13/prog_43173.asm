; DESCRIPTION: Composite: Sets a single orange pixel at (105, 29) then Draws a orange rectangle at (63, 98) with width 14 and height 97 then Renders a magenta line between points (173, 114) and (73, 128).
; PLAN: r0=105(x), r1=29(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=63(x), r6=98(y), r7=14(width), r8=97(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=173(x1), r11=114(y1), r12=73(x2), r13=128(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 105
LDI r1, 29
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 63
LDI r6, 98
LDI r7, 14
LDI r8, 97
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 173
LDI r11, 114
LDI r12, 73
LDI r13, 128
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
