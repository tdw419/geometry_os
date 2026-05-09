; DESCRIPTION: Composite: Draws a orange line from (487, 228) to (104, 31) then Renders a black box of size 16x32 starting at (374, 125) then Renders a orange disk with center (158, 122) and radius 26.
; PLAN: r0=487(x1), r1=228(y1), r2=104(x2), r3=31(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=374(x), r6=125(y), r7=16(width), r8=32(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=158(x), r11=122(y), r12=26(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 487
LDI r1, 228
LDI r2, 104
LDI r3, 31
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 374
LDI r6, 125
LDI r7, 16
LDI r8, 32
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 158
LDI r11, 122
LDI r12, 26
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
