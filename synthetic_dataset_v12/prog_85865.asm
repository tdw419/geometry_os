; DESCRIPTION: Composite: Sets a single magenta pixel at (82, 44) then Places a purple line segment connecting (337, 54) to (494, 114) then Draws a cyan rectangle at (107, 190) with width 120 and height 15.
; PLAN: r0=82(x), r1=44(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=337(x1), r6=54(y1), r7=494(x2), r8=114(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=107(x), r11=190(y), r12=120(width), r13=15(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 82
LDI r1, 44
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 337
LDI r6, 54
LDI r7, 494
LDI r8, 114
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 107
LDI r11, 190
LDI r12, 120
LDI r13, 15
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
