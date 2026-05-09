; DESCRIPTION: Composite: Places a purple dot at position (284, 79) then Draws a purple line from (457, 191) to (429, 139) then Draws a cyan circle centered at (446, 86) with radius 42.
; PLAN: r0=284(x), r1=79(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=457(x1), r6=191(y1), r7=429(x2), r8=139(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=446(x), r11=86(y), r12=42(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 284
LDI r1, 79
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 457
LDI r6, 191
LDI r7, 429
LDI r8, 139
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 446
LDI r11, 86
LDI r12, 42
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
