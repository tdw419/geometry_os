; DESCRIPTION: Composite: Draws a red line from (25, 146) to (78, 14) then Places a white dot at position (478, 63) then Places a orange 33x67 rectangle at position (441, 111).
; PLAN: r0=25(x1), r1=146(y1), r2=78(x2), r3=14(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=478(x), r6=63(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=441(x), r11=111(y), r12=33(width), r13=67(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 25
LDI r1, 146
LDI r2, 78
LDI r3, 14
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 478
LDI r6, 63
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 441
LDI r11, 111
LDI r12, 33
LDI r13, 67
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
