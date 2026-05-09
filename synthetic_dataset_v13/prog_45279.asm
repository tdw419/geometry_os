; DESCRIPTION: Composite: Creates a orange circular shape at (357, 109) with radius 14 then Places a purple dot at position (116, 219) then Renders a cyan line between points (7, 86) and (173, 25).
; PLAN: r0=357(x), r1=109(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=116(x), r6=219(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=7(x1), r11=86(y1), r12=173(x2), r13=25(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 357
LDI r1, 109
LDI r2, 14
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 116
LDI r6, 219
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 7
LDI r11, 86
LDI r12, 173
LDI r13, 25
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
