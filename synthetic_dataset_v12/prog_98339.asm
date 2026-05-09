; DESCRIPTION: Composite: Places a purple dot at position (411, 244) then Renders a magenta line between points (319, 145) and (190, 253) then Renders a cyan box of size 87x38 starting at (233, 152).
; PLAN: r0=411(x), r1=244(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=319(x1), r6=145(y1), r7=190(x2), r8=253(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=233(x), r11=152(y), r12=87(width), r13=38(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 411
LDI r1, 244
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 319
LDI r6, 145
LDI r7, 190
LDI r8, 253
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 233
LDI r11, 152
LDI r12, 87
LDI r13, 38
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
