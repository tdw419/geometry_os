; DESCRIPTION: Composite: Sets a single purple pixel at (431, 114) then Places a blue 75x89 rectangle at position (140, 98) then Renders a magenta line between points (48, 195) and (315, 219).
; PLAN: r0=431(x), r1=114(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=140(x), r6=98(y), r7=75(width), r8=89(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=48(x1), r11=195(y1), r12=315(x2), r13=219(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 431
LDI r1, 114
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 140
LDI r6, 98
LDI r7, 75
LDI r8, 89
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 48
LDI r11, 195
LDI r12, 315
LDI r13, 219
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
