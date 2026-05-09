; DESCRIPTION: Composite: Draws a magenta line from (405, 17) to (273, 227) then Creates a purple rectangular region at (271, 164) spanning 54 by 15 pixels then Places a purple dot at position (90, 215).
; PLAN: r0=405(x1), r1=17(y1), r2=273(x2), r3=227(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=271(x), r6=164(y), r7=54(width), r8=15(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=90(x), r11=215(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 405
LDI r1, 17
LDI r2, 273
LDI r3, 227
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 271
LDI r6, 164
LDI r7, 54
LDI r8, 15
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 90
LDI r11, 215
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
