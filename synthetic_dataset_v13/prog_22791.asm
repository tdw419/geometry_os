; DESCRIPTION: Composite: Sets a single orange pixel at (118, 72) then Renders a purple box of size 28x36 starting at (321, 142) then Places a orange circle of radius 34 at center (320, 56).
; PLAN: r0=118(x), r1=72(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=321(x), r6=142(y), r7=28(width), r8=36(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=320(x), r11=56(y), r12=34(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 118
LDI r1, 72
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 321
LDI r6, 142
LDI r7, 28
LDI r8, 36
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 320
LDI r11, 56
LDI r12, 34
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
