; DESCRIPTION: Composite: Places a orange 24x56 rectangle at position (405, 64) then Renders a orange line between points (61, 245) and (109, 39) then Renders a purple disk with center (225, 195) and radius 47.
; PLAN: r0=405(x), r1=64(y), r2=24(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=61(x1), r6=245(y1), r7=109(x2), r8=39(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=225(x), r11=195(y), r12=47(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 405
LDI r1, 64
LDI r2, 24
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 61
LDI r6, 245
LDI r7, 109
LDI r8, 39
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 225
LDI r11, 195
LDI r12, 47
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
