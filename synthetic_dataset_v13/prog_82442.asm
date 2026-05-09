; DESCRIPTION: Composite: Renders a green line between points (74, 74) and (216, 173) then Places a purple dot at position (499, 198) then Renders a red box of size 86x52 starting at (212, 79).
; PLAN: r0=74(x1), r1=74(y1), r2=216(x2), r3=173(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=499(x), r6=198(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=212(x), r11=79(y), r12=86(width), r13=52(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 74
LDI r1, 74
LDI r2, 216
LDI r3, 173
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 499
LDI r6, 198
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 212
LDI r11, 79
LDI r12, 86
LDI r13, 52
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
