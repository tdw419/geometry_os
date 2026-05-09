; DESCRIPTION: Composite: Draws a purple line from (254, 149) to (319, 168) then Places a black 87x90 rectangle at position (406, 143).
; PLAN: r0=254(x1), r1=149(y1), r2=319(x2), r3=168(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=406(x), r6=143(y), r7=87(width), r8=90(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 254
LDI r1, 149
LDI r2, 319
LDI r3, 168
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 406
LDI r6, 143
LDI r7, 87
LDI r8, 90
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
