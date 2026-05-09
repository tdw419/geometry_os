; DESCRIPTION: Composite: Places a magenta dot at position (495, 213) then Renders a purple line between points (15, 144) and (246, 201) then Places a black 33x43 rectangle at position (18, 25).
; PLAN: r0=495(x), r1=213(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=15(x1), r6=144(y1), r7=246(x2), r8=201(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=18(x), r11=25(y), r12=33(width), r13=43(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 495
LDI r1, 213
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 15
LDI r6, 144
LDI r7, 246
LDI r8, 201
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 18
LDI r11, 25
LDI r12, 33
LDI r13, 43
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
