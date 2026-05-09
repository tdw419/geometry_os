; DESCRIPTION: Composite: Creates a orange rectangular region at (198, 64) spanning 19 by 45 pixels then Places a blue dot at position (332, 72) then Draws a red line from (94, 213) to (508, 190).
; PLAN: r0=198(x), r1=64(y), r2=19(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=332(x), r6=72(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=94(x1), r11=213(y1), r12=508(x2), r13=190(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 198
LDI r1, 64
LDI r2, 19
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 332
LDI r6, 72
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 94
LDI r11, 213
LDI r12, 508
LDI r13, 190
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
